---
layout: page
title: Past Examples
parent: Final Project
nav_order: 2
permalink: /docs/final_project/examples/
---

<h1 id="final-project-past-examples">
 Final Project Past Examples
  
  
</h1>
<p>Explore final projects and reports from past semesters in CP255 and CP101 for inspiration and examples of different project types.</p>
<section aria-labelledby="fp-showcase-title" class="fp-showcase">
<style>
    .fp-showcase {
      margin-top: 1rem;
    }

    .fp-showcase .fp-toolbar {
      display: flex;
      flex-wrap: wrap;
      gap: 0.5rem 0.75rem;
      align-items: center;
      margin: 1rem 0 1.25rem;
      padding: 0.75rem 1rem;
      border: 1px solid #e6e6ee;
      background: #f9f9fb;
      border-radius: 10px;
    }

    .fp-showcase .fp-toolbar-title {
      font-weight: 600;
      color: #383942;
      margin-right: 0.5rem;
    }

    .fp-showcase .fp-filter {
      display: flex;
      flex-wrap: wrap;
      gap: 0.4rem;
    }

    .fp-showcase .fp-filter button {
      border: 1px solid #d6d6e3;
      background: #fff;
      color: #383942;
      padding: 0.25rem 0.6rem;
      border-radius: 999px;
      font-size: 0.85rem;
      cursor: pointer;
      transition: all 0.15s ease;
    }

    .fp-showcase .fp-filter button[aria-pressed="true"] {
      border-color: #1d70b8; /* WCAG AA contrast on white (was #3C88E0) */
      background: #3C88E0;
      color: #fff;
    }

    .fp-showcase .fp-filter button:hover {
      border-color: #1d70b8; /* WCAG AA contrast on white (was #3C88E0) */
    }

    .fp-showcase .fp-count {
      margin-left: auto;
      font-size: 0.9rem;
      color: #5a5b66;
    }

    .fp-showcase .fp-sort {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 0.5rem;
      margin: 0 0 1rem;
      padding: 0.5rem 0.75rem;
      border: 1px solid #e6e6ee;
      background: #fafafa;
      border-radius: 10px;
      font-size: 0.9rem;
      color: #5a5b66;
    }

    .fp-showcase .fp-sort select {
      padding: 0.35rem 0.6rem;
      border-radius: 8px;
      border: 1px solid #d6d6e3;
      background: #fff;
      color: #383942;
      font-size: 0.9rem;
    }

    .fp-showcase .fp-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 0.85rem;
    }

    .fp-showcase .fp-card {
      display: flex;
      flex-direction: column;
      border: 1px solid #e6e6ee;
      border-radius: 12px;
      padding: 0.8rem;
      background: #fff;
      box-shadow: 0 1px 2px rgba(18, 18, 23, 0.06);
      transition: transform 0.15s ease, box-shadow 0.15s ease;
      cursor: default;
    }

    .fp-showcase .fp-card:hover {
      box-shadow: 0 2px 6px rgba(18, 18, 23, 0.08);
    }

    /* Cards keep a white background in both color schemes, so headings must
       stay dark even when the site-wide dark theme lightens heading colors. */
    .fp-showcase .fp-card h3 {
      color: #1c1c1e;
    }

    .fp-showcase .fp-image {
      width: 100%;
      aspect-ratio: 4 / 3;
      border-radius: 10px;
      background: linear-gradient(135deg, #edf0f6 0%, #f7f8fb 100%);
      border: 1px solid #e6e6ee;
      margin-bottom: 0.6rem;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #8b8c98;
      font-size: 0.75rem;
      text-transform: uppercase;
      letter-spacing: 0.08em;
    }

    .fp-showcase .fp-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
    }

    .fp-showcase .fp-tags {
      display: flex;
      flex-wrap: wrap;
      gap: 0.35rem;
      margin: 0.1rem 0 0.45rem;
    }

    .fp-showcase .fp-card h3 {
      margin: 0 0 0.35rem;
      font-size: 0.98rem;
    }

    .fp-showcase .fp-card p {
      margin: 0 0 0.6rem;
      color: #5a5b66;
      font-size: 0.85rem;
    }

    .fp-showcase .fp-meta {
      display: flex;
      flex-wrap: wrap;
      gap: 0.35rem;
      align-items: center;
      margin-top: auto;
    }

    .fp-showcase .fp-chip {
      background: #f0f2f8;
      color: #3a3b44;
      border-radius: 999px;
      padding: 0.16rem 0.5rem;
      font-size: 0.7rem;
    }

    .fp-showcase .fp-links {
      width: 100%;
      display: flex;
      flex-wrap: wrap;
      gap: 0.35rem;
      margin-top: 0.35rem;
    }

    .fp-showcase .fp-link {
      display: inline-flex;
      align-items: center;
      gap: 0.25rem;
      color: #1d70b8; /* WCAG AA contrast on white (was #3C88E0) */
      font-weight: 600;
      text-decoration: none;
      font-size: 0.8rem;
    }

    .fp-showcase .fp-link + .fp-link::before {
      content: "|";
      color: #9aa0ad;
      margin: 0 0.4rem 0 0.2rem;
    }

    .fp-showcase .fp-link:hover {
      text-decoration: underline;
    }


    .fp-showcase .fp-empty {
      padding: 1.5rem;
      border: 1px dashed #d6d6e3;
      border-radius: 12px;
      color: #5a5b66;
      text-align: center;
      display: none;
    }

    @media (max-width: 640px) {
      .fp-showcase .fp-toolbar {
        align-items: stretch;
      }

      .fp-showcase .fp-toolbar-title,
      .fp-showcase .fp-count {
        width: 100%;
      }

      .fp-showcase .fp-filter button,
      .fp-showcase .fp-filter-clear {
        width: 100%;
        text-align: center;
      }

      .fp-showcase .fp-card {
        padding: 0.85rem;
      }

      .fp-showcase .fp-links {
        width: 100%;
        margin-top: 0.35rem;
      }

      .fp-showcase .fp-sort {
        align-items: stretch;
      }

      .fp-showcase .fp-sort select {
        width: 100%;
      }
    }

    @media (max-width: 900px) {
      .fp-showcase .fp-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>

<div class="fp-sort">
<span>Sort by</span>
<select aria-label="Sort projects" data-sort="select">
<option value="semester-newest">Semester (newest)</option>
<option value="semester-oldest">Semester (oldest)</option>
<option selected="" value="class-az">Class (A–Z)</option>
<option value="class-za">Class (Z–A)</option>
<option value="az">Title (A–Z)</option>
<option value="za">Title (Z–A)</option>
</select>
</div>
<div class="fp-grid" data-filter="grid">
<article class="fp-card" data-course="CP255" data-semester="Spring 2025" data-tags="Floods, CP255, Spring 2025, Website, Report">
<div class="fp-image">
<img alt="Flood Risk Vulnerability preview" src="{{ site.baseurl }}/assets/images/final_project_images/flood_risk_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Floods</span>
<span class="fp-chip">CP255</span>
<span class="fp-chip">Spring 2025</span>
<span class="fp-chip">Website</span>
<span class="fp-chip">Report</span>
</div>
<h3>
 Flood Risk Vulnerability in San Francisco
  
  
</h3>
<p>An interactive dashboard analyzing how infrastructure, environment, and socioeconomic factors shape flood risk and community vulnerability across San Francisco.</p>
<div class="fp-links">
<a class="fp-link" href="https://huggingface.co/spaces/Maryfire/Flood_risk_SF" rel="noopener" target="_blank">Visit site</a>
<a class="fp-link" href="https://drive.google.com/file/d/1IhRYN82vAIKOzAhJ-Nq0xuTfqD_87keK/view?usp=sharing" rel="noopener" target="_blank">Access report</a>
</div>
</article>
<article class="fp-card" data-course="CP255" data-semester="Spring 2025" data-tags="Parks, CP255, Spring 2025, Report">
<div class="fp-image">
<img alt="Park-ximity report preview" src="{{ site.baseurl }}/assets/images/final_project_images/park-ximity_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Parks</span>
<span class="fp-chip">CP255</span>
<span class="fp-chip">Spring 2025</span>
<span class="fp-chip">Report</span>
</div>
<h3>
 What’s my PARK-XIMITY?
  
  
</h3>
<p>A spatial analysis project measuring overall park accessibility in the greater city of San Francisco using park quality, location, and low-stress travel routes.</p>
<div class="fp-links">
<a class="fp-link" href="https://drive.google.com/file/d/1D8g9qglvWyKrMmkpSp4TGAW-ozFRdzE4/view?usp=sharing" rel="noopener" target="_blank">Access report</a>
</div>
</article>
<article class="fp-card" data-course="CP255" data-semester="Spring 2025" data-tags="Transit, CP255, Spring 2025, Report">
<div class="fp-image">
<img alt="AC Transit Service Variations preview" src="{{ site.baseurl }}/assets/images/final_project_images/ac_transit_service_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Transit</span>
<span class="fp-chip">CP255</span>
<span class="fp-chip">Spring 2025</span>
<span class="fp-chip">Report</span>
</div>
<h3>
 AC Transit Service Variations
  
  
</h3>
<p>A data and spatial analysis project examining transit reliability and service equity across Oakland by linking AC Transit performance with neighborhood demographics.</p>
<div class="fp-links">
<a class="fp-link" href="https://drive.google.com/file/d/1vJR7v-6LjicSEZiYDS13NsA8BM1odQ3o/view?usp=sharing" rel="noopener" target="_blank">Access report</a>
</div>
</article>
<article class="fp-card" data-course="CP255" data-semester="Spring 2025" data-tags="Rentals, CP255, Spring 2025, Report">
<div class="fp-image">
<img alt="Short-term Rentals &amp; Noise Complaints preview" src="{{ site.baseurl }}/assets/images/final_project_images/short-term_rentals_noise_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Rentals</span>
<span class="fp-chip">CP255</span>
<span class="fp-chip">Spring 2025</span>
<span class="fp-chip">Report</span>
</div>
<h3>
 Short-term Rentals &amp; Noise Complaints
  
  
</h3>
<p>A spatial and statistical analysis project exploring how Airbnb short term rental regulations relate to changes in residential noise complaints in New York City.</p>
<div class="fp-links">
<a class="fp-link" href="https://drive.google.com/file/d/16CfiwFhHQ3e2UNOaQ8wG1JNtIoj3zaom/view?usp=sharing" rel="noopener" target="_blank">Access report</a>
</div>
</article>
<article class="fp-card" data-course="CP101" data-semester="Fall 2025" data-tags="Transit, CP101, Fall 2025, Website">
<div class="fp-image">
<img alt="Transit Access Equity in Alameda County preview" src="{{ site.baseurl }}/assets/images/final_project_images/transit_access_equity_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Transit</span>
<span class="fp-chip">CP101</span>
<span class="fp-chip">Fall 2025</span>
<span class="fp-chip">Website</span>
</div>
<h3>
 Transit Access Equity in Alameda County
  
  
</h3>
<p>A regional transit accessibility analysis examining how time of day affects job access by public transit in Alameda County, with a focus on equity priority communities.</p>
<div class="fp-links">
<a class="fp-link" href="https://rabahbabaci.github.io/MTC-Transit_Access_Equity/" rel="noopener" target="_blank">Visit site</a>
</div>
</article>
<article class="fp-card" data-course="CP101" data-semester="Fall 2025" data-tags="Transit, CP101, Fall 2025, Website">
<div class="fp-image">
<img alt="Great Highway Closure Changes in Traffic &amp; Pedestrian Safety preview" src="{{ site.baseurl }}/assets/images/final_project_images/great_highway_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Transit</span>
<span class="fp-chip">CP101</span>
<span class="fp-chip">Fall 2025</span>
<span class="fp-chip">Website</span>
</div>
<h3>
 Great Highway Closure Changes in Traffic &amp; Pedestrian Safety
  
  
</h3>
<p>An analysis of how the Great Highway closure in San Francisco affected traffic patterns, mobility, and pedestrian safety outcomes across nearby neighborhoods.</p>
<div class="fp-links">
<a class="fp-link" href="https://storymaps.arcgis.com/stories/9ab0271a09d4475fbccc68f57e97d70e" rel="noopener" target="_blank">Visit site</a>
</div>
</article>
<article class="fp-card" data-course="CP101" data-semester="Fall 2025" data-tags="Transit, CP101, Fall 2025, Website">
<div class="fp-image">
<img alt="Transit Equity &amp; Ridership Collapse in Berkeley preview" src="{{ site.baseurl }}/assets/images/final_project_images/transit_equity_berkeley_project_image.png"/>
</div>
<div class="fp-tags">
<span class="fp-chip">Transit</span>
<span class="fp-chip">CP101</span>
<span class="fp-chip">Fall 2025</span>
<span class="fp-chip">Website</span>
</div>
<h3>
 Berkeley Transit Equity &amp; Ridership Collapse
  
  
</h3>
<p>A transit equity analysis examining how ridership and transit access patterns changed across BART stations in the city ofBerkeley over time.</p>
<div class="fp-links">
<a class="fp-link" href="https://anandashar01.github.io/bart-transit-equity-full/" rel="noopener" target="_blank">Visit site</a>
</div>
</article>
</div>
<div class="fp-empty" data-filter="empty">No projects match those tags. Try clearing filters.</div>
<script>
    (function () {
      var showcase = document.querySelector(".fp-showcase");
      if (!showcase) return;

      var cards = Array.from(showcase.querySelectorAll(".fp-card"));
      var filterWrap = showcase.querySelector("[data-filter='buttons']");
      var countEl = showcase.querySelector("[data-filter='count']");
      var emptyEl = showcase.querySelector("[data-filter='empty']");
      var sortSelect = showcase.querySelector("[data-sort='select']");

      function semesterKey(value) {
        if (!value) return 0;
        var parts = value.trim().split(/\s+/);
        if (parts.length < 2) return 0;
        var term = parts[0].toLowerCase();
        var year = parseInt(parts[1], 10) || 0;
        var order = 0;
        if (term === "spring") order = 1;
        else if (term === "summer") order = 2;
        else if (term === "fall") order = 3;
        else if (term === "winter") order = 4;
        return year * 10 + order;
      }

      function sortCards(mode) {
        var grid = showcase.querySelector("[data-filter='grid']");
        if (!grid) return;
        var sorted = cards.slice();
        function courseRank(value) {
          var c = (value || "").toLowerCase();
          if (c === "cp255") return 0;
          if (c === "cp101") return 1;
          return 2;
        }
        if (mode === "semester-oldest") {
          sorted.sort(function (a, b) {
            return semesterKey(a.getAttribute("data-semester")) - semesterKey(b.getAttribute("data-semester"));
          });
        } else if (mode === "class-az") {
          sorted.sort(function (a, b) {
            var aCourse = a.getAttribute("data-course") || "";
            var bCourse = b.getAttribute("data-course") || "";
            var rankDiff = courseRank(aCourse) - courseRank(bCourse);
            if (rankDiff !== 0) return rankDiff;
            return aCourse.localeCompare(bCourse);
          });
        } else if (mode === "class-za") {
          sorted.sort(function (a, b) {
            var aCourse = a.getAttribute("data-course") || "";
            var bCourse = b.getAttribute("data-course") || "";
            var rankDiff = courseRank(bCourse) - courseRank(aCourse);
            if (rankDiff !== 0) return rankDiff;
            return bCourse.localeCompare(aCourse);
          });
        } else if (mode === "az") {
          sorted.sort(function (a, b) {
            return (a.querySelector("h3")?.textContent || "").localeCompare((b.querySelector("h3")?.textContent || ""));
          });
        } else if (mode === "za") {
          sorted.sort(function (a, b) {
            return (b.querySelector("h3")?.textContent || "").localeCompare((a.querySelector("h3")?.textContent || ""));
          });
        } else {
          sorted.sort(function (a, b) {
            return semesterKey(b.getAttribute("data-semester")) - semesterKey(a.getAttribute("data-semester"));
          });
        }
        sorted.forEach(function (card) { grid.appendChild(card); });
      }

      if (filterWrap) {
        var tagSet = new Map();
        cards.forEach(function (card) {
          var tags = (card.getAttribute("data-tags") || "")
            .split(",")
            .map(function (tag) { return tag.trim().replace(/\s+/g, " "); })
            .filter(Boolean);
          tags.forEach(function (tag) {
            var key = tag.toLowerCase();
            if (!tagSet.has(key)) tagSet.set(key, tag);
          });
        });

        function renderButtons() {
          filterWrap.innerHTML = "";
          tagSet.forEach(function (label, key) {
            var btn = document.createElement("button");
            btn.type = "button";
            btn.textContent = label;
            btn.setAttribute("data-tag", key);
            btn.setAttribute("aria-pressed", "false");
            filterWrap.appendChild(btn);
          });
        }

        function getActiveTags() {
          return Array.from(filterWrap.querySelectorAll("button[aria-pressed='true']"))
            .map(function (btn) { return btn.getAttribute("data-tag"); });
        }

        function applyFilters() {
          var active = getActiveTags();
          var visibleCount = 0;

          cards.forEach(function (card) {
            var tags = (card.getAttribute("data-tags") || "")
              .split(",")
              .map(function (tag) {
                return tag.trim().replace(/\s+/g, " ").toLowerCase();
              })
              .filter(Boolean);

            var match = active.length === 0 || active.every(function (tag) {
              return tags.indexOf(tag) !== -1;
            });

            card.hidden = !match;
            card.setAttribute("aria-hidden", match ? "false" : "true");
            if (match) visibleCount += 1;
          });

          if (countEl) {
            countEl.textContent = visibleCount + " project" + (visibleCount === 1 ? "" : "s");
          }
          if (emptyEl) {
            emptyEl.style.display = visibleCount === 0 ? "block" : "none";
          }
        }

        renderButtons();
        applyFilters();

        filterWrap.addEventListener("click", function (event) {
          var target = event.target;
          var btn = target && target.closest ? target.closest("button"): null;
          if (!btn) return;
          var isPressed = btn.getAttribute("aria-pressed") === "true";
          btn.setAttribute("aria-pressed", isPressed ? "false" : "true");
          applyFilters();
        });
      }

      if (sortSelect) {
        sortCards(sortSelect.value);
        sortSelect.addEventListener("change", function () {
          sortCards(sortSelect.value);
        });
      }
    })();
  </script>
</section>
