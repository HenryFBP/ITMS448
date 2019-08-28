---
title: >-
  TOR Browser's Weaknesses
subtitle:  Mozilla, Firefox, Certificates, addons, and users
documentclass: scrartcl
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

In May of 2019, exactly past midnight of 2019-05-04 UTC, a certificate expired. This certificate was an intermediate certificate in a chain of certificates [^mozilla_certs] that Mozilla used, by extension, to sign add-ons for Firefox. [^expired_mozilla_response1] [^expired_mozilla_response2] [^expired_mozilla_response3]

Shortly after this, Mozilla experienced a slew of complaints [^firefox_cert_bug1] [^firefox_cert_bug2] [^firefox_cert_bug3] [^firefox_cert_bug4] from users who reported that all of their add-ons had been disabled. For some, this was an inconvenience. For others, this was unacceptable and prevented them from browsing the internet safely, such as citizens who must avoid government surveillance by using proxy addons, or the Tor Browser.

[^mozilla_certs]: <https://hg.mozilla.org/mozilla-central/raw-file/tip/security/nss/lib/ckfw/builtins/certdata.txt>

[^expired_mozilla_response1]: <https://hacks.mozilla.org/2019/05/technical-details-on-the-recent-firefox-add-on-outage/>

[^expired_mozilla_response2]: <https://support.mozilla.org/en-US/kb/add-ons-disabled-or-fail-to-install-firefox#w_add-ons-appearing-as-unsupported-or-disappeared-from-your-aboutaddons-page>

[^expired_mozilla_response3]: <https://addons.mozilla.org/en-US/firefox/addon/disabled-add-on-fix-61-65/>


[^firefox_cert_bug1]: <https://bugzilla.mozilla.org/show_bug.cgi?id=1549061>

[^firefox_cert_bug2]: <https://bugzilla.mozilla.org/show_bug.cgi?id=1549718>

[^firefox_cert_bug3]: <https://bugzilla.mozilla.org/show_bug.cgi?id=1548973>

[^firefox_cert_bug4]: <https://github.com/mozilla/addons/issues/978>

## Digitally signed Firefox adoons

Most trustworthy add-ons that can be installed to Firefox must be digitally signed by Mozilla if they wish to be displayed in AMO (<https://addons.mozilla.org>) for users to easily install.

Mozilla creates a certificate specifically designated for signing addons with an intermediate certificate at its root, which explains why those signed addons failed to load. The entire chain, from the addon signing certificate up to the root certificate, must validate or the entire chain is considered untrustworthy.

There is a subroutine within Firefox's addon-loading code that will validate the certificate chain[^addon_disabling_code] before loading an addon[^addon_disabling_code2], and this will fail if the entire certificate chain does not validate. This was the case for many users, and this code was likely involved.

[^addon_disabling_code]: <https://dxr.mozilla.org/mozilla-central/rev/2c268d869bc48dc4d5e8ff036cac82375ecf507a/toolkit/mozapps/extensions/internal/XPIDatabase.jsm#2118>

[^addon_disabling_code2]: <https://dxr.mozilla.org/mozilla-central/source/toolkit/mozapps/extensions/internal/XPIProvider.jsm>

## Tor Browser addons disabled

On the same day, all users who use the Tor Browser were affected by the issue in a strange way: JavaScript, which is normally disabled on the Tor Browser for security reasons, was enabled for all users.[^tor_noscript_bug]

This could have exposed thousands of users of the Tor Browser to malicious JavaScript hosted on the Tor network, which is a small part of a larger group of overlay networks that are generally referred to as the 'dark web'.

[^tor_noscript_bug]: <https://trac.torproject.org/projects/tor/ticket/30388>

### Mozilla as a vulnerability

The larger problem with the Tor Browser is that it depends heavily on multiple platforms that it does not directly manage. It depends on Mozilla's code, their certificates, and plugins signed by them.

This is a problem when things like this happen. All of the certificates that Mozilla has embedded within their browser and plugins are not managed by the people who maintain the Tor Browser, making Mozilla's certificates as well as their authority to revoke them a large weak point for the Tor Browser.

The Tor Browser's deployment, administration, and certificate validation is also not decentralized, which is another large flaw that makes Mozilla and Firefox a point of attack[^tor_mozilla_chaos] with respect to the Tor Browser.

If Mozilla or the Tor Browser maintaners were to be compromised, the Tor Browser would likely be compromised as well. It also goes without saying that any vulnerabilities that affect Firefox must affect the Tor Browser[^tor_zeroday_mail].

[^tor_zeroday_mail]: <https://lists.torproject.org/pipermail/tor-talk/2016-November/042639.html>

[^tor_mozilla_chaos]: <https://nakedsecurity.sophos.com/2019/05/05/mozilla-bug-throws-tor-browser-users-into-chaos/>

#### 0-day

An example of the dangers of this dependency that the Tor Browser has on Firefox is a zero-day ROP binary exploit[^firefox_zeroday_bug] that used Firefox's memory allocation to execute arbitrary code by spraying the heap.

Not only does this issue have to be remediated through Mozilla's mailing lists and own processes, but it also will take longer to be pushed out to Tor Browser users because it must go through extra processes that the maintainers of the Tor Browser do not control.

[^firefox_zeroday_bug]: <https://bugzilla.mozilla.org/show_bug.cgi?id=1478036>

### Users as a vulnerability

A regular user, not a security professional, who uses a system such as the Tor Browser requires a set of easy to understand controls that enforce the usage of the program.

Vague messages about security, long loading times with no explanation[^usability_paper], and complicated user interfaces will cause some users to misuse the Tor Browser in a way that compromises their security.

Similarly, it must be made explicit to users when their current mode of operation is insecure. The dangers need to be made clear and unambiguous when JavaScript is on, TLS is off, or their IP is leaking. Not every user will be able to identify these scenarios.

[^usability_paper]: Norcie, Greg & Caine, Kelly & Camp, L. (2012). Eliminating Stop-Points in the Installation and Use of Anonymity Systems: a Usability Evaluation of the Tor Browser Bundle.

## Defending the Tor browser

The Tor browser is a great tool for anonymizing oneself, but it can be misused by users, have defenses neutered by dependencies such as Mozilla, and is at times constrained by the platforms on which it was built.

In order to improve the security and reliability of the Tor Browser, it must be more independent of the technical decisions made about Firefox and it must not rely upon centralized sources for security decisions.

The Tor Browser, as well as Mozilla and Web Engines in general, must pursue robust ROP binary exploit defenses[^defending_tor_browser_anon][^randheap], because ROP binary exploits have been steadily growing in popularity[^see_google_scholar_rop_bin_exp] and many researchers believe they are going to be relevant[^heap_spray_survival] as long as memory management issues exist[^cve_heap_spray].

The users of the Tor Browser need to have consistent and dead-simple interactions with the Tor Browser to stop usability issues from preventing them from using the browser properly.

It must not be ambiguous or difficult for users to determine the status of their connection, the security of any particular webpage, or if they must update their browser to fix a security issue if the maintainers of the Tor Browser want their user base to be secure.

[^cve_heap_spray]: <https://nvd.nist.gov/vuln/detail/CVE-2018-18500>

[^heap_spray_survival]: Joel Coffman, Daniel M. Kelly, Christopher C. Wellons, and Andrew S. Gearhart. 2016. ROP Gadget Prevalence and Survival under Compiler-based Binary Diversification Schemes. In Proceedings of the 2016 ACM Workshop on Software PROtection (SPRO '16). ACM, New York, NY, USA, 15-26. DOI: https://doi.org/10.1145/2995306.2995309


[^randheap]: A. Jangda and M. Mishra, "RandHeap: Heap Randomization for Mitigating Heap Spray Attacks in Virtual Machines," 2017 15th Annual Conference on Privacy, Security and Trust (PST), Calgary, AB, 2017, pp. 169-16909.
doi: 10.1109/PST.2017.00028

[^defending_tor_browser_anon]: Conti, Mauro & Crane, Stephen & Frassetto, Tommaso & Homescu, Andrei & Koppen, Georg & Larsen, Per & Liebchen, Christopher & Perry, Mike & Sadeghi, Ahmad-Reza. (2016). Selfrando: Securing the Tor Browser against De-anonymization Exploits. Proceedings on Privacy Enhancing Technologies. 2016. 10.1515/popets-2016-0050.

[^see_google_scholar_rop_bin_exp]: As of 2015, Google Scholar returns over 3,000 papers about ROP Binary Exploitation: <https://scholar.google.com/scholar?as_ylo=2015&q=ROP+binary+exploitation>

Until these issues with the Tor Browser and Firefox's memory management are fixed, you might want to browse Tor with `curl` or `lynx`
