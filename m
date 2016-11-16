Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJZtf1s5NzDvch
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 18:01:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAG6xET1078232
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 02:01:43 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26qxsc9rkn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 02:01:43 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Wed, 16 Nov 2016 00:01:42 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Nov 2016 00:01:38 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id E9CBF19D80B7;
 Wed, 16 Nov 2016 00:00:25 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAG713fI31064098; Wed, 16 Nov 2016 00:01:03 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E47F7805F;
 Wed, 16 Nov 2016 00:01:03 -0700 (MST)
Received: from [9.77.193.31] (unknown [9.77.193.31])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id AB86778047;
 Wed, 16 Nov 2016 00:01:01 -0700 (MST)
Subject: Re: Discussion on IPMI provider libraries
To: Patrick Williams <patrick@stwcx.xyz>,
 Brendan Higgins <brendanhiggins@google.com>
References: <58208518.50202@linux.vnet.ibm.com>
 <CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com>
 <5821A449.3020807@linux.vnet.ibm.com>
 <CAFd5g46QM8PyrGSFjL2Otq_dLOmCcdELL_-nQh1Th09kPMbYFQ@mail.gmail.com>
 <20161115105807.GJ15757@heinlein.lan>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Wed, 16 Nov 2016 12:30:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20161115105807.GJ15757@heinlein.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16111607-0024-0000-0000-0000150832D8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006086; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00781339; UDB=6.00376893; IPR=6.00558849; 
 BA=6.00004883; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013342; XFM=3.00000011;
 UTC=2016-11-16 07:01:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16111607-0025-0000-0000-0000462C449C
Message-Id: <582C042B.6080302@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611160122
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
X-List-Received-Date: Wed, 16 Nov 2016 07:01:46 -0000



On Tuesday 15 November 2016 04:28 PM, Patrick Williams wrote:
> On Mon, Nov 14, 2016 at 03:59:08PM -0800, Brendan Higgins wrote:
>>> The privilege provided by each command is a registration parameter and it
>>> is consumed only by net-ipmid.
>>
>> That's fine, but in that case it should not go in the callback; it should
>> be maintained and enforced by net-ipmid when it looks up a handler.
> Neither net-ipmid nor host-ipmid intrinsically know all of the IPMI
> commands that will or may be registered.  This is especially true for
> OEM commands where the privilege level is determined by the command.
Agree.
>
> Are the privilege levels defined by the IPMI spec?  If so, I don't see
> anything incorrect about each provider having it.  If not, it is
> something that we have defined at build time, correct?  Would it be
> acceptable to have multiple symlink locations for net-ipmid providers?
> ie. /usr/lib/phosphor-net-ipmid/user/ ,
> /usr/lib/phosphor-net-ipmid/admin/ , etc.  I suspect we would need to
> break libraries up more because currently a single library provides
> commands at different privilege levels.
>
My earlier mail got stripped off when Brendan replied which had details 
about the privilege levels.

The Privilege levels are defined by the IPMI specification. Table G - 
Command Number Assignments and Privilege Levels in the IPMI 
specification gives more details on this.

Every command has a privilege level assigned to the command( Admin, 
User, Operator or Callback) or the command is system interface only.

The plan is to break down the system interface commands into a separate 
library.  The apphandler library in phospor-host-ipmid had support for 
Get Message Flags,
Set BMC Global Enables and Read Event Message Buffer which are System 
Interface commands only. So that net-ipmid would not load the system 
interface commands.
In a similar way if an OEM command need not be loaded for net-ipmid, 
then no symlink would be provided for that library in 
/usr/lib/phosphor-net-ipmid.

I have pushed a patch for separating system interface commands: 
https://gerrit.openbmc-project.xyz/#/c/1020/

I did not completely understand the rationale behind having multiple 
symlink locations for net-ipmid providers. The phosphor-net-ipmid would 
load the provider libraries
at starting and net-ipmid would allow multiple sessions with different 
privilege levels. There is a 'Set Session Privilege Level' command which 
would change the privilege level to a
higher( based on the maximum privilege supported for the user) or lower 
privilege level.

So the suggestion for multiple symlink  locations for net-ipmid 
providers(net-ipmid/user.. net-ipmid/admin) is a way for net-ipmid to 
figure out the privilege level of the command
instead of a registration parameter(privilege level) in the callback 
handler?
