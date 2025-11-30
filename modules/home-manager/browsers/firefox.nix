# modules/home-manager/browsers/firefox.nix
# Firefox HM settings
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      # Extensions
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          multi-account-containers
          languagetool
          bitwarden
          proton-pass
          proton-vpn
          side-view
          mullvad
          search-by-image
        ];
      };

      settings = {
        # Startup
        "browser.startup.page" = 0;
        "browser.startup.homepage" = "about:blank";
        "browser.aboutwelcome.enabled" = false;
        "browser.aboutConfig.showWarning" = false;

        # Search
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchTerms.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.quicksuggest.nonsponsored" = false;
        "browser.urlbar.quicksuggest.sponsored" = false;
        "browser.urlbar.trimHttps" = true;

        # Privacy - Telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";

        # Privacy - Firefox tracking
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "breakpad.reportURL" = "";
        "browser.discovery.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

        # Privacy - Content blocking
        "browser.contentblocking.category" = "strict";
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.annotate_channels.strict_list.enabled" = true;
        "privacy.query_stripping.enabled" = true;
        "privacy.query_stripping.enabled.pbmode" = true;
        "privacy.bounceTrackingProtection.mode" = 1;

        # Privacy - Fingerprinting
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting.pbmode" = true;
        "privacy.resistFingerprinting.block_mozAddonManager" = true;
        "privacy.spoof_english" = 1;
        "privacy.window.maxInnerWidth" = 1600;

        # Privacy - Other
        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "browser.formfill.enable" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        # Privacy - Network
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.predictor.enabled" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;
        "captivedetect.canonicalURL" = "";
        "network.trr.mode" = 5;
        "network.proxy.socks_remote_dns" = true;

        # Privacy - WebRTC
        "media.peerconnection.ice.default_address_only" = true;
        "media.peerconnection.ice.no_host" = true;
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;

        # Privacy - Geolocation
        "geo.provider.use_corelocation" = false;
        "geo.provider.use_geoclue" = false;
        "geo.provider.ms-windows-location" = false;
        "permissions.default.geo" = 2;
        "permissions.default.desktop-notification" = 2;

        # Privacy - Sanitize on shutdown
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown_v2.cache" = true;
        "privacy.clearOnShutdown_v2.downloads" = true;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearHistory.cookiesAndStorage" = false;

        # Security
        "security.ssl.require_safe_negotiation" = true;
        "security.tls.enable_0rtt_data" = false;
        "security.OCSP.require" = true;
        "security.cert_pinning.enforcement_level" = 2;
        "security.mixed_content.block_display_content" = true;
        "network.auth.subresource-http-auth-allow" = 1;
        "network.IDN_show_punycode" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;

        # Downloads
        "browser.download.useDownloadDir" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.start_downloads_in_tmp_dir" = true;

        # UI preferences
        "browser.compactmode.show" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.newtabpage.enabled" = false;
        "browser.uitour.enabled" = false;
        "browser.preferences.moreFromMozilla" = false;
        "findbar.highlightAll" = true;
        "general.autoScroll" = true;
        "browser.shell.shortcutFavicons" = false;
        "widget.gtk.overlay-scrollbars.enabled" = false;
        "full-screen-api.warning.timeout" = 0;
        "browser.link.open_newwindow.restriction" = 0;
        "dom.disable_window_move_resize" = true;

        # PDF
        "pdfjs.enableScripting" = false;
        "browser.download.open_pdf_attachments_inline" = true;

        # Performance
        "browser.cache.disk.enable" = false;
        "browser.sessionstore.interval" = 60000;
        "browser.sessionhistory.max_total_viewers" = 4;
        "browser.sessionstore.privacy_level" = 2;
        "content.notify.interval" = 100000;
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;
        "image.mem.decode_bytes_at_a_time" = 32768;
        "media.cache_readahead_limit" = 7200;
        "media.cache_resume_threshold" = 3600;
        "media.memory_cache_max_size" = 65536;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.pacing.requests.enabled" = false;
        "network.dnsCacheExpiration" = 3600;
        "network.ssl_tokens_cache_capacity" = 10240;

        # Misc
        "browser.shopping.experience2023.enabled" = false;
        "extensions.pocket.enabled" = false;
        "browser.urlbar.pocket.featureGate" = false;
        "media.eme.enabled" = true;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "accessibility.typeaheadfind.flashBar" = 0;
        "editor.truncate_user_pastes" = false;
        "browser.menu.showViewImageInfo" = true;
        "media.webrtc.pipewire.enabled" = true;

        # AI chatbot (Claude)
        "browser.ml.chat.provider" = "https://claude.ai/new";
        "browser.ml.chat.shortcuts" = false;

        # Extensions settings
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "extensions.postDownloadThirdPartyPrompt" = false;
        "permissions.manager.defaultsUrl" = "";

        # Custom CSS support
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
