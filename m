Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kw2p3tPwzDqJW
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 17:13:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0N5x9NF022704
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 01:13:35 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q6et877x4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 01:13:35 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Wed, 23 Jan 2019 06:13:32 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 23 Jan 2019 06:13:31 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0N6DUXB7602492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Jan 2019 06:13:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9B98A4040;
 Wed, 23 Jan 2019 06:13:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CF57A404D;
 Wed, 23 Jan 2019 06:13:28 +0000 (GMT)
Received: from [9.102.0.153] (unknown [9.102.0.153])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 23 Jan 2019 06:13:27 +0000 (GMT)
Subject: Re: Intel-ipmi-oem repo
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
Cc: Bradley W Bishop <bradleyb@us.ibm.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, jason.m.bills@intel.com,
 dkodihal@linux.vnet.ibm.com, Emily Shaffer <emilyshaffer@google.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Wed, 23 Jan 2019 11:43:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
Content-Type: multipart/alternative;
 boundary="------------34F9CEAD7D9C69ECB75E4477"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19012306-0008-0000-0000-000002B4B8CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012306-0009-0000-0000-00002220E741
Message-Id: <275b2db5-798f-b5c2-697a-bac50d6cd223@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901230048
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
X-List-Received-Date: Wed, 23 Jan 2019 06:13:39 -0000

This is a multi-part message in MIME format.
--------------34F9CEAD7D9C69ECB75E4477
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On Wednesday 23 January 2019 03:35 AM, Ed Tanous wrote:
> On 1/22/19 10:16 AM, Vijay Khemka wrote:
>>
>> Team,
>>
>> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. 
>> I see several functionality in this repo like sensors and storage 
>> commands are generic enough to be used by other platform who is using 
>> entity manager. So I feel that we should have these functionalities 
>> to be moved to a separate common repo which can be used by everyone 
>> and this repo can only contain Intel OEM specific IPMI command support.
>>
> When this work was first started, the hope was that the SDR, SEL and 
> the sensor numbering changes could be rolled out to the whole project 
> as the "standard", and that this was just a staging area.  
> Unfortunately, when we tried to push them, we got some late breaking 
> feedback from the maintainer that some flows (like writing sensor 
> values from the host) would break IBM systems.  Given that our systems 
> didn't require or implement those flows, we didn't have a very clear 
> path forward for how to get them upstreamed, and eventually ran out of 
> time waiting for responses.
>
This is disappointing to hear, feedback was provided as early as May 
2018 and discussed in the community calls earlier that that. 
(https://gerrit.openbmc-project.xyz/#/c/openbmc/s2600wf-misc/+/8521/). 
The major point of concern was arbitrary sensor numbers and the solution 
was a flexible way to assign sensor numbers to sensor D-bus objects.
>
> The last thread I recall on the issue was here, where the maintainer 
> documented some of the issues that were present on IBM systems with 
> those command sets.  There were several other gerrit reviews that I 
> can find if needed, but they basically boiled down to what's in the 
> thread below.
>
> https://lists.ozlabs.org/pipermail/openbmc/2018-November/014139.html
>
> Given that it sounds like the community is interested in these changes 
> being rolled out to more than just intel systems, I suspect we need to 
> continue that discussion.
>
> For reference, the changes being mentioned enable:
>
> 1. Dynamic IPMI sensor creation based on dbus mapper reflection, 
> rather than hardcoded paths and sensor numbers.
> 2. Automatic generation of type 1 SDRs (including M and B scaling) 
> from dbus interfaces.
> 3. Automatic generation of FRU sdr records based on dbus interfaces.
>
> There are probably other things that I'm forgetting, but these are the 
> highlights.
>
> Tom,
>
> Do you think that you could propose a path that would allow these 
> changes into the mainstream, while still keeping IBM systems 
> functional?  Based on comments that I've heard both in person, and on 
> other gerrit reviews, I believe these changes have some level of 
> support from the other two IPMI maintainers (correct me if I'm wrong 
> guys).
>
In the case of SEL we did make progress and reached a consensus. The 
proposed solution was to support mapping sensor number to sensor D-Bus 
object paths in a flexible way(support both arbitrary mapping and 
hardcoded sensor number), so that IBM systems can coexist with the 
proposed SEL architecture. Jason was pursuing that and we haven't heard 
from him for quite some time, this was brought in the community call 
multiple times.

There was OpenPower OEM specific stuff in the standard implementation of 
the SEL and i am done with moving that to the OEM library.

If the final answer is that we really need yet another repo, so be it, 
I'm happy to help maintain it, but given the interest, we should at 
least investigate the possibility of making this the "standard" going 
forward.
>>
>> My 2 cents 😊
>>
> Much appreciated.


--------------34F9CEAD7D9C69ECB75E4477
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On Wednesday 23 January 2019 03:35 AM,
      Ed Tanous wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">On 1/22/19 10:16 AM, Vijay Khemka
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=utf-8">
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
          <p class="MsoNormal"><span
              style="font-size:11.0pt;color:black">Team,</span><span
              style="color:black"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:11.0pt;color:black">Intel-ipmi-oem should
              be broken and 2 parts, genric and oem specific. I see
              several functionality in this repo like sensors and
              storage commands are generic enough to be used by other
              platform who is using entity manager. So I feel that we
              should have these functionalities to be moved to a
              separate common repo which can be used by everyone and
              this repo can only contain Intel OEM specific IPMI command
              support.</span><span style="color:black"><o:p></o:p></span></p>
        </div>
      </blockquote>
      <p>When this work was first started, the hope was that the SDR,
        SEL and the sensor numbering changes could be rolled out to the
        whole project as the "standard", and that this was just a
        staging area.  Unfortunately, when we tried to push them, we got
        some late breaking feedback from the maintainer that some flows
        (like writing sensor values from the host) would break IBM
        systems.  Given that our systems didn't require or implement
        those flows, we didn't have a very clear path forward for how to
        get them upstreamed, and eventually ran out of time waiting for
        responses.</p>
    </blockquote>
    This is disappointing to hear, feedback was provided as early as May
    2018 and discussed in the community calls earlier that that.
    (<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/openbmc/s2600wf-misc/+/8521/">https://gerrit.openbmc-project.xyz/#/c/openbmc/s2600wf-misc/+/8521/</a>).
    The major point of concern was arbitrary sensor numbers and the
    solution was a flexible way to assign sensor numbers to sensor D-bus
    objects.<br>
    <blockquote type="cite"
      cite="mid:1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com">
      <p>The last thread I recall on the issue was here, where the
        maintainer documented some of the issues that were present on
        IBM systems with those command sets.  There were several other
        gerrit reviews that I can find if needed, but they basically
        boiled down to what's in the thread below.<br>
      </p>
      <p><a class="moz-txt-link-freetext"
href="https://lists.ozlabs.org/pipermail/openbmc/2018-November/014139.html"
          moz-do-not-send="true">https://lists.ozlabs.org/pipermail/openbmc/2018-November/014139.html</a></p>
      <p>Given that it sounds like the community is interested in these
        changes being rolled out to more than just intel systems, I
        suspect we need to continue that discussion.</p>
      <p>For reference, the changes being mentioned enable:</p>
      <p>1. Dynamic IPMI sensor creation based on dbus mapper
        reflection, rather than hardcoded paths and sensor numbers.<br>
        2. Automatic generation of type 1 SDRs (including M and B
        scaling) from dbus interfaces.<br>
        3. Automatic generation of FRU sdr records based on dbus
        interfaces.</p>
      <p>There are probably other things that I'm forgetting, but these
        are the highlights.</p>
      <p>Tom,</p>
      <p>Do you think that you could propose a path that would allow
        these changes into the mainstream, while still keeping IBM
        systems functional?  Based on comments that I've heard both in
        person, and on other gerrit reviews, I believe these changes
        have some level of support from the other two IPMI maintainers
        (correct me if I'm wrong guys).</p>
    </blockquote>
    In the case of SEL we did make progress and reached a consensus. The
    proposed solution was to support mapping sensor number to sensor
    D-Bus object paths in a flexible way(support both arbitrary mapping
    and hardcoded sensor number), so that IBM systems can coexist with
    the proposed SEL architecture. Jason was pursuing that and we
    haven't heard from him for quite some time, this was brought in the
    community call multiple times. <br>
    <br>
    There was OpenPower OEM specific stuff in the standard
    implementation of the SEL and i am done with moving that to the OEM
    library. <br>
    <br>
    If the final answer is that we really need yet another repo, so be
    it, I'm happy to help maintain it, but given the interest, we should
    at least investigate the possibility of making this the "standard"
    going forward.<br>
    <blockquote type="cite"
      cite="mid:1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com">
      <blockquote type="cite"
        cite="mid:B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com">
        <div class="WordSection1">
          <p class="MsoNormal"><span
              style="font-size:11.0pt;color:black"> </span><span
              style="color:black"><o:p></o:p></span></p>
          <p class="MsoNormal"><span
              style="font-size:11.0pt;color:black">My 2 cents </span><span
              style="font-size:11.0pt;font-family:&quot;Apple Color
              Emoji&quot;;color:black">😊</span><span
              style="color:black"><o:p></o:p></span></p>
          <span style="font-size:11.0pt;color:black"></span><span
            style="color:black"><o:p></o:p></span> </div>
      </blockquote>
      Much appreciated.<br>
    </blockquote>
    <br>
  </body>
</html>

--------------34F9CEAD7D9C69ECB75E4477--
