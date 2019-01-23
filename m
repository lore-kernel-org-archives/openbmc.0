Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43l9n33RHczDqK6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 03:32:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 08:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,512,1539673200"; 
 d="scan'208,217";a="314177935"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2019 08:32:35 -0800
Subject: Re: Intel-ipmi-oem repo
To: Tom Joseph <tomjose@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: Bradley W Bishop <bradleyb@us.ibm.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, jason.m.bills@intel.com,
 dkodihal@linux.vnet.ibm.com, Emily Shaffer <emilyshaffer@google.com>
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
 <275b2db5-798f-b5c2-697a-bac50d6cd223@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <12723f71-dc40-1306-b7fc-e238222aa230@intel.com>
Date: Wed, 23 Jan 2019 08:34:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <275b2db5-798f-b5c2-697a-bac50d6cd223@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------0A27918944684332EE558A5E"
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
X-List-Received-Date: Wed, 23 Jan 2019 16:32:40 -0000

This is a multi-part message in MIME format.
--------------0A27918944684332EE558A5E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On 1/22/19 10:13 PM, Tom Joseph wrote:
> On Wednesday 23 January 2019 03:35 AM, Ed Tanous wrote:
>> On 1/22/19 10:16 AM, Vijay Khemka wrote:
>>> In the case of SEL we did make progress and reached a consensus. The
>>> proposed solution was to support mapping sensor number to sensor
>>> D-Bus object paths in a flexible way(support both arbitrary mapping
>>> and hardcoded sensor number), so that IBM systems can coexist with
>>> the proposed SEL architecture. Jason was pursuing that and we
>>> haven't heard from him for quite some time, this was brought in the
>>> community call multiple times. =

I was unaware Jason was still pursuing that, my understanding was that
there wasn't a clear path forward for that change series to be
compatible with IBM systems.  Was there any details on what the proposed
solution was, and what the next steps are?  It sounds like Vijay is
hitting a bit of a wall with having that stuff checked into meta-intel; 
I'd much rather roll those changes out into net-ipmid than create a new
repo.

As Brad said earlier in the thread, the proliferation of repos is
getting a bit nutty, and I'd like to avoid it if at all possible.


--------------0A27918944684332EE558A5E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/22/19 10:13 PM, Tom Joseph wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:275b2db5-798f-b5c2-697a-bac50d6cd223@linux.vnet.ibm.com">
      <div class="moz-cite-prefix">On Wednesday 23 January 2019 03:35
        AM, Ed Tanous wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com">
        <div class="moz-cite-prefix">On 1/22/19 10:16 AM, Vijay Khemka
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com">
          <meta name="Generator" content="Microsoft Word 15
            (filtered&#xA; medium)">
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
--></style>In the case of SEL we did make progress and reached a
          consensus. The proposed solution was to support mapping sensor
          number to sensor D-Bus object paths in a flexible way(support
          both arbitrary mapping and hardcoded sensor number), so that
          IBM systems can coexist with the proposed SEL architecture.
          Jason was pursuing that and we haven't heard from him for
          quite some time, this was brought in the community call
          multiple times. =<br>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>I was unaware Jason was still pursuing that, my understanding was
      that there wasn't a clear path forward for that change series to
      be compatible with IBM systems.  Was there any details on what the
      proposed solution was, and what the next steps are?  It sounds
      like Vijay is hitting a bit of a wall with having that stuff
      checked into meta-intel;  I'd much rather roll those changes out
      into net-ipmid than create a new repo.</p>
    <p>As Brad said earlier in the thread, the proliferation of repos is
      getting a bit nutty, and I'd like to avoid it if at all possible.<br>
    </p>
  </body>
</html>

--------------0A27918944684332EE558A5E--
