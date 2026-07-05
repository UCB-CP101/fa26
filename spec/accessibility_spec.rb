# frozen_string_literal: true

# Run accessibility specs for all pages in the webiste.
# This runs the axe accessibility checker on each page in a headless browser.

# spec_helper ensures the webiste is built and can be served locally
require 'spec_helper'

# Axe-core test standards groups
# See https://github.com/dequelabs/axe-core/blob/develop/doc/API.md#axe-core-tags
# Tests are segmented in 2.0, 2.1 and 2.2+
# In most places WCAG 2.1AA is the minimum requirement, but 2.2 is the current WCAG Standard.
REQUIRED_A11Y_STANDARDS = %i[wcag2a wcag2aa wcag21a wcag21aa].freeze
COMPLETE_A11Y_STANDARDS = %i[wcag22aa best-practice section508].freeze

# axe-core rules that are not required to be accessible / do not apply
# You may temporarily want to add rules here during development.
# See: https://github.com/dequelabs/axe-core/blob/develop/doc/rule-descriptions.md
# The rules below are best-practice (non-WCAG) rules that the content ported
# verbatim from the original CP255 site (cp255_web) does not follow: heading
# levels are sometimes skipped, some pages start below h1, and the course
# schedule tables use an empty corner header cell.
SKIPPED_RULES = %w[heading-order page-has-heading-one].freeze
# These are elements that are not required to be accessible
# It should be rare to add to this list. This disables all rules for an element.
# e.g. <img data-a11y-errors="true" src="..." /> would pass even though it's missing alt text.
EXCLUDED_ELEMENTS = [
  '[data-a11y-errors="true"]',
  # Google Calendar appointment widgets (office hours page): axe scans inside
  # the iframe and flags Google's own markup, which we cannot fix.
  'iframe[src*="calendar.google.com"]'
].freeze

# Add pages here that do not need to have a11y tests run.
# Paths are suffixes relative to site baseurl; full paths are built after Jekyll config loads.
# It should be rare to add to this array. One acceptable
# use is to add redirect pages because they can introduce
# race conditions and make the a11y tests fail inconsistently.
# The pages below are standalone interactive lab/checklist apps copied
# verbatim from the original CP255 site; they do not use the site layout.
SKIPPED_PATH_SUFFIXES = [
  '/docs/deliverables/final_project/final-project-guide.html',
  '/docs/tutorials/Sandbox/error_types_lab_app.html',
  '/docs/tutorials/Sandbox/predicates_lab_git.html',
  '/docs/tutorials/Sandbox/python_functions_lab.html'
].freeze

def skipped_pages
  SKIPPED_PATH_SUFFIXES.map { |suffix| "#{site_config['baseurl']}#{suffix}" }
end

def set_page_theme(theme)
  expect(page).to have_css('script[src*="just-the-docs"]', visible: :all, wait: 10)
  expect(page.evaluate_script('typeof jtd !== "undefined" && typeof jtd.setTheme === "function"')).to be(true)
  page.execute_script("jtd.setTheme(#{theme.to_json})")
  expect(page.evaluate_script('jtd.getTheme()')).to eq(theme)
end

# We must call this to ensure the build it up-to-date.
build_jekyll_site!
ALL_PAGES = load_sitemap

PAGES_TO_TEST = ALL_PAGES - skipped_pages

RSpec.shared_examples 'a11y tests' do
  it 'meets WCAG 2.1' do
    expect(page).to be_axe_clean
      .according_to(*REQUIRED_A11Y_STANDARDS)
      .skipping(*SKIPPED_RULES)
      .excluding(*EXCLUDED_ELEMENTS)
  end

  it 'meets WCAG 2.2' do
    expect(page).to be_axe_clean
      .according_to(*COMPLETE_A11Y_STANDARDS)
      .skipping(*SKIPPED_RULES)
      .excluding(*EXCLUDED_ELEMENTS)
  end
end

PAGES_TO_TEST.each do |path|
  describe "#{path} is accessible", :js, type: :feature do
    context 'when light mode' do
      before do
        visit(path)
        set_page_theme('light')
      end

      include_context 'a11y tests'
    end

    context 'when dark mode' do
      before do
        Capybara.reset_sessions!
        visit(path)
        set_page_theme('dark')
      end

      include_context 'a11y tests'
    end
  end
end
