{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.danilo = {

      # about:config
      settings = {
        # UI / Behavior
        "browser.startup.page" = 3; # restore previous session
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.aboutConfig.showWarning" = false;
        "general.smoothScroll" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

        # Network & Privacy
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.usage.uploadEnabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "signon.rememberSignons" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.clearOnShutdown_v2.cache" = false;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
        "privacy.history.custom" = true;
        "browser.safebrowsing.provider.mozilla.lastupdatetime" = "0";
        "browser.safebrowsing.provider.mozilla.nextupdatetime" = "0";

        # Language / Region
        "intl.accept_languages" = "pt-br,en-us,en";
        "browser.search.region" = "BR";
        "doh-rollout.home-region" = "BR";

        # Features / UX
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "app.normandy.first_run" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.download.panel.shown" = true;
        "media.eme.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
      };

      # Extensions
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        bitwarden
        youtube-no-translation
      ];
    };
  };
}
