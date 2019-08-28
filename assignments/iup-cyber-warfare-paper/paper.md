---
title: >-
  TOR: Certificates, addons, and Firefox
author:
  - Henry Post
date: '\today{}'
geometry: margin=2cm
header-includes:
  - '\usepackage{setspace}'
  - \singlespacing
---


\newpage

## Mozilla's Certificates

In May of 2019, exactly past midnight of 2019-05-04 UTC, a certificate expired. This certificate was an intermediate certificate in a chain of certificates that Mozilla used, by extension, to sign add-ons for Firefox. [^expired_mozilla_response]

Shortly after this, Mozilla experienced a slew of complaints from users who reported that all of their add-ons had been disabled. For some, this was an inconvenience. For others, this was unacceptable and prevented them from browsing the internet safely, such as Chinese or Kazakhstanian citizens who must avoid government surveillance.

[^expired_mozilla_response]: <https://hacks.mozilla.org/2019/05/technical-details-on-the-recent-firefox-add-on-outage/>

## Digitally signed Firefox adoons

Most trustworthy add-ons that can be installed to Firefox must be digitally signed by Mozilla if they wish to be displayed in AMO (<https://addons.mozilla.org>) for users to easily install.

Mozilla creates a certificate specifically designated for signing addons with an intermediate certificate at its root, which explains why those signed addons failed to load. The entire chain, from the addon signing certificate up to the root certificate, must validate or the entire chain is considered untrustworthy.

There is a subroutine within Firefox's addon-loading code that will validate the certificate chain[^addon_disabling_code] before loading an addon, and this will fail if the entire certificate chain does not validate. This was the case for many users, and this code was likely involved.

[^addon_disabling_code]: <https://dxr.mozilla.org/mozilla-central/rev/2c268d869bc48dc4d5e8ff036cac82375ecf507a/toolkit/mozapps/extensions/internal/XPIDatabase.jsm#2118>

## Unforeseen Consequences



## Firefox as a vulnerability

## Defending the Tor browser

TODO: https://www.degruyter.com/downloadpdf/j/popets.2016.2016.issue-4/popets-2016-0050/popets-2016-0050.pdf



\newpage

## All citations

### TOR NoScript

<https://blog.torproject.org/noscript-temporarily-disabled-tor-browser>

<https://nakedsecurity.sophos.com/2019/05/05/mozilla-bug-throws-tor-browser-users-into-chaos/>

### Mozilla's responses

<https://blog.mozilla.org/addons/2019/05/04/update-regarding-add-ons-in-firefox/>

<https://hacks.mozilla.org/2019/05/technical-details-on-the-recent-firefox-add-on-outage/>

<https://support.mozilla.org/en-US/kb/add-ons-disabled-or-fail-to-install-firefox#w_add-ons-appearing-as-unsupported-or-disappeared-from-your-aboutaddons-page>

<https://addons.mozilla.org/en-US/firefox/addon/disabled-add-on-fix-61-65/>

#### Firefox bug tracking
<https://bugzilla.mozilla.org/show_bug.cgi?id=1549061>

<https://bugzilla.mozilla.org/show_bug.cgi?id=1549718>

<https://bugzilla.mozilla.org/show_bug.cgi?id=1548973>

<https://github.com/mozilla/addons/issues/978>

<https://trac.torproject.org/projects/tor/ticket/30388>

### Mozilla Certificates
<https://hg.mozilla.org/mozilla-central/raw-file/tip/security/nss/lib/ckfw/builtins/certdata.txt>

### Firefox source code

#### Firefox extension initialization code

<https://dxr.mozilla.org/mozilla-central/source/toolkit/mozapps/extensions/internal/XPIProvider.jsm>

#### Addon-disabling code

<https://dxr.mozilla.org/mozilla-central/rev/2c268d869bc48dc4d5e8ff036cac82375ecf507a/toolkit/mozapps/extensions/internal/XPIDatabase.jsm#2118>
