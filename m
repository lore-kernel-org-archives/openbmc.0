Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kj8c5BlXzDqLg
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 09:02:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 14:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,508,1539673200"; 
 d="scan'208,217";a="313924641"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jan 2019 14:02:50 -0800
Subject: Re: Intel-ipmi-oem repo
To: openbmc@lists.ozlabs.org
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
Date: Tue, 22 Jan 2019 14:05:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
Content-Type: multipart/alternative;
 boundary="------------BAD328A68D62F4AD3C2F7CB5"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2019 22:02:57 -0000

This is a multi-part message in MIME format.
--------------BAD328A68D62F4AD3C2F7CB5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 1/22/19 10:16 AM, Vijay Khemka wrote:
>
> Team,
>
> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific.
> I see several functionality in this repo like sensors and storage
> commands are generic enough to be used by other platform who is using
> entity manager. So I feel that we should have these functionalities to
> be moved to a separate common repo which can be used by everyone and
> this repo can only contain Intel OEM specific IPMI command support.
>
When this work was first started, the hope was that the SDR, SEL and the
sensor numbering changes could be rolled out to the whole project as the
"standard", and that this was just a staging area.  Unfortunately, when
we tried to push them, we got some late breaking feedback from the
maintainer that some flows (like writing sensor values from the host)
would break IBM systems.  Given that our systems didn't require or
implement those flows, we didn't have a very clear path forward for how
to get them upstreamed, and eventually ran out of time waiting for
responses.

The last thread I recall on the issue was here, where the maintainer
documented some of the issues that were present on IBM systems with
those command sets.  There were several other gerrit reviews that I can
find if needed, but they basically boiled down to what's in the thread
below.

https://lists.ozlabs.org/pipermail/openbmc/2018-November/014139.html

Given that it sounds like the community is interested in these changes
being rolled out to more than just intel systems, I suspect we need to
continue that discussion.

For reference, the changes being mentioned enable:

1. Dynamic IPMI sensor creation based on dbus mapper reflection, rather
than hardcoded paths and sensor numbers.
2. Automatic generation of type 1 SDRs (including M and B scaling) from
dbus interfaces.
3. Automatic generation of FRU sdr records based on dbus interfaces.

There are probably other things that I'm forgetting, but these are the
highlights.

Tom,

Do you think that you could propose a path that would allow these
changes into the mainstream, while still keeping IBM systems
functional?  Based on comments that I've heard both in person, and on
other gerrit reviews, I believe these changes have some level of support
from the other two IPMI maintainers (correct me if I'm wrong guys).


If the final answer is that we really need yet another repo, so be it,
I'm happy to help maintain it, but given the interest, we should at
least investigate the possibility of making this the "standard" going
forward.

>  
>
> My 2 cents 😊
>
Much appreciated.

--------------BAD328A68D62F4AD3C2F7CB5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 1/22/19 10:16 AM, Vijay Khemka
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Apple Color Emoji";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt;color:black">Team,</span><span
            style="color:black"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;color:black">Intel-ipmi-oem
            should be broken and 2 parts, genric and oem specific. I see
            several functionality in this repo like sensors and storage
            commands are generic enough to be used by other platform who
            is using entity manager. So I feel that we should have these
            functionalities to be moved to a separate common repo which
            can be used by everyone and this repo can only contain Intel
            OEM specific IPMI command support.</span><span
            style="color:black"><o:p></o:p></span></p>
      </div>
    </blockquote>
    <p>When this work was first started, the hope was that the SDR, SEL
      and the sensor numbering changes could be rolled out to the whole
      project as the "standard", and that this was just a staging area. 
      Unfortunately, when we tried to push them, we got some late
      breaking feedback from the maintainer that some flows (like
      writing sensor values from the host) would break IBM systems. 
      Given that our systems didn't require or implement those flows, we
      didn't have a very clear path forward for how to get them
      upstreamed, and eventually ran out of time waiting for responses.</p>
    <p>The last thread I recall on the issue was here, where the
      maintainer documented some of the issues that were present on IBM
      systems with those command sets.  There were several other gerrit
      reviews that I can find if needed, but they basically boiled down
      to what's in the thread below.<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/pipermail/openbmc/2018-November/014139.html">https://lists.ozlabs.org/pipermail/openbmc/2018-November/014139.html</a></p>
    <p>Given that it sounds like the community is interested in these
      changes being rolled out to more than just intel systems, I
      suspect we need to continue that discussion.</p>
    <p>For reference, the changes being mentioned enable:</p>
    <p>1. Dynamic IPMI sensor creation based on dbus mapper reflection,
      rather than hardcoded paths and sensor numbers.<br>
      2. Automatic generation of type 1 SDRs (including M and B scaling)
      from dbus interfaces.<br>
      3. Automatic generation of FRU sdr records based on dbus
      interfaces.</p>
    <p>There are probably other things that I'm forgetting, but these
      are the highlights.</p>
    <p>Tom,</p>
    <p>Do you think that you could propose a path that would allow these
      changes into the mainstream, while still keeping IBM systems
      functional?  Based on comments that I've heard both in person, and
      on other gerrit reviews, I believe these changes have some level
      of support from the other two IPMI maintainers (correct me if I'm
      wrong guys).</p>
    <p><br>
    </p>
    <p>If the final answer is that we really need yet another repo, so
      be it, I'm happy to help maintain it, but given the interest, we
      should at least investigate the possibility of making this the
      "standard" going forward.<br>
    </p>
    <blockquote type="cite"
      cite="mid:B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt;color:black"> </span><span
            style="color:black"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;color:black">My
            2 cents </span><span
            style="font-size:11.0pt;font-family:&quot;Apple Color
            Emoji&quot;;color:black">😊</span><span style="color:black"><o:p></o:p></span></p>
        <span style="font-size:11.0pt;color:black"></span><span
          style="color:black"><o:p></o:p></span>
      </div>
    </blockquote>
    Much appreciated.<br>
  </body>
</html>

--------------BAD328A68D62F4AD3C2F7CB5--
