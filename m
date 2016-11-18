Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tLF8T3d2fzDvy8
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 10:49:28 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAINmM4o123440
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 18:49:25 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26t39xwfu2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 18:49:25 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Fri, 18 Nov 2016 16:49:24 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 18 Nov 2016 16:49:21 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id BDC6B1FF001E;
 Fri, 18 Nov 2016 16:49:00 -0700 (MST)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAINnL5F14025140; Fri, 18 Nov 2016 16:49:21 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3959ABE038;
 Fri, 18 Nov 2016 16:49:21 -0700 (MST)
Received: from [9.10.99.167] (unknown [9.10.99.167])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id F11B4BE039;
 Fri, 18 Nov 2016 16:49:20 -0700 (MST)
Subject: Re: Jenkins job for per-repository CI
To: Patrick Williams <patrick@stwcx.xyz>,
 Andrew Geissler <geissonator@gmail.com>
References: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
 <20161118225429.6mytshalgitazutd@asimov>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: msbarth <msbarth@linux.vnet.ibm.com>
Date: Fri, 18 Nov 2016 17:50:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20161118225429.6mytshalgitazutd@asimov>
Content-Type: multipart/alternative;
 boundary="------------AE0DFB44DB40164417650412"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16111823-0004-0000-0000-000010E34810
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006101; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00782607; UDB=6.00377667; IPR=6.00560077; 
 BA=6.00004892; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013373; XFM=3.00000011;
 UTC=2016-11-18 23:49:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16111823-0005-0000-0000-00007AB55E0C
Message-Id: <3c5a3bbe-6fa6-fa14-2e70-7f734de1769b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-18_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611180405
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2016 23:49:30 -0000

This is a multi-part message in MIME format.
--------------AE0DFB44DB40164417650412
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, that is the plan. This was just a step in getting the initial 
scripts working correctly with Jenkins as the openpower.xyz Jenkins 
server is different than the test Jenkins Andrew setup for me to 
prototype in.


On 11/18/2016 04:54 PM, Patrick Williams wrote:
> On Fri, Nov 18, 2016 at 03:39:24PM -0600, Andrew Geissler wrote:
>> For initial prototype work, we created a jenkins job to trigger on
>> phosphor-event gerrit changes.  That job is here -
>> https://openpower.xyz/job/phosphor-event-gerrit-trigger/
> Are you going to convert that over to a template job so that we do not
> need to create (and manage) a new Jenkins job for each repository?
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--------------AE0DFB44DB40164417650412
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Yes, that is the plan. This was just a step in getting the
      initial scripts working correctly with Jenkins as the
      openpower.xyz Jenkins server is different than the test Jenkins
      Andrew setup for me to prototype in.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/18/2016 04:54 PM, Patrick
      Williams wrote:<br>
    </div>
    <blockquote cite="mid:20161118225429.6mytshalgitazutd@asimov"
      type="cite">
      <pre wrap="">On Fri, Nov 18, 2016 at 03:39:24PM -0600, Andrew Geissler wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">For initial prototype work, we created a jenkins job to trigger on
phosphor-event gerrit changes.  That job is here -
<a class="moz-txt-link-freetext" href="https://openpower.xyz/job/phosphor-event-gerrit-trigger/">https://openpower.xyz/job/phosphor-event-gerrit-trigger/</a>
</pre>
      </blockquote>
      <pre wrap="">
Are you going to convert that over to a template job so that we do not
need to create (and manage) a new Jenkins job for each repository?

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
openbmc mailing list
<a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------AE0DFB44DB40164417650412--
