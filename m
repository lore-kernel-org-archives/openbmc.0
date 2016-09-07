Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sTvnt5zQRzDsM6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 06:14:42 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u87KE5Zj045209
 for <openbmc@lists.ozlabs.org>; Wed, 7 Sep 2016 16:14:37 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25a2cw0kxh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2016 16:14:37 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 7 Sep 2016 14:14:36 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 7 Sep 2016 14:14:33 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: mspinler@linux.vnet.ibm.com
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id A2FBC1FF0050;
 Wed,  7 Sep 2016 14:14:14 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u87KEX7716056604; Wed, 7 Sep 2016 13:14:33 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D96A478038;
 Wed,  7 Sep 2016 14:14:32 -0600 (MDT)
Received: from [9.10.222.21] (unknown [9.10.222.21])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id B2E0C78056;
 Wed,  7 Sep 2016 14:14:32 -0600 (MDT)
Subject: Re: Charts from OpenBMC MRW Talk
To: Joel Stanley <joel@jms.id.au>
References: <a9f038e2-6208-2d40-32f0-27f5434bfbe3@linux.vnet.ibm.com>
 <CACPK8XdQ1ef6gLqjgL-YvkzBoxpedjoiY_-TzvZF+4sJ9R-p2Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Wed, 7 Sep 2016 15:15:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdQ1ef6gLqjgL-YvkzBoxpedjoiY_-TzvZF+4sJ9R-p2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16090720-0012-0000-0000-00001093E1E0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005724; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000185; SDB=6.00755039; UDB=6.00357417; IPR=6.00527933; 
 BA=6.00004701; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012617; XFM=3.00000011;
 UTC=2016-09-07 20:14:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16090720-0013-0000-0000-0000453EA6AC
Message-Id: <46c45587-03fe-fa16-21a1-841254850bf8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1609070308
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2016 20:14:43 -0000

Hi Joel,


On 8/28/2016 11:44 PM, Joel Stanley wrote:
> Hello Matt,
>
> On Fri, Aug 26, 2016 at 1:21 AM, Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>> Here are the charts from the Machine Readable Workbook talk I gave on 8/25.
> Thanks for sending these along. I was unable to attend you call as it
> was at 1:00am, and I was skiing in the Australian alps. Are there any
> notes from the presentation that you have to share?
>
> I gave the slides a read. Some questions I had:
>
> Serverwiz. I cloned the repository and tried to build with ant. It
> failed due to some hardcoded Windows paths. I opened a ticket here:
> https://github.com/open-power/serverwiz/issues/20

Looks like Norm said he fixed this.  Also, in general people should 
never need to
build serverwiz themselves.  They can just download the jars from the 
release page.


> XML Patching. Under what circumstances would you patch the XML when
> you have the entire thing available to edit?
In the past we've seen where the person who own the MRW XML, who is 
usually outside
of the firmware group, is slow to bring an XML fix through a pull 
request under
github.com/open-power/<system>-xml.  With a patch, we can make a fix 
within our
own repository without having to check in the full <system>.xml which 
otherwise doesn't
exist inside the openbmc repositories.  It also allows the fix to remain 
across multiple
MRW XML updates if they don't fix the desired thing.  Additionally, it 
can add an easier
way to phase in new code that uses new XML, first by using the patching 
mechanism and
then later updating the real XML.

> Current status. You have some upcoming goals there. I would be
> interested in seeing "generation of device tree" pushed much higher up
> the list. I think device tree is an alternative representation of the
> MRW. Because of that it would be an easy target for your prototyping,
> and would allow us to see how it works in practice for a well
> understood use case.
Sounds reasonable, though I don't personally have any experience with 
device trees
so it will be slow going for me.


> Another use case is generating the Python that describes the
> platform's GPIOs (skeleton/configs/*.py). This has been a source of
> recent bugs, so making sure the MRW matches the Python would help
> shake out some more issues.
Sure, I can add that to the list.

> Cheers,
>
> Joel
>
