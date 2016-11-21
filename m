Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMt7G6wrczDvhw
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 02:39:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uALFd3hT051081
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 10:39:03 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26v13g66g7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 10:38:54 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Mon, 21 Nov 2016 08:38:53 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 Nov 2016 08:38:51 -0700
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 5D6C019D8045;
 Mon, 21 Nov 2016 08:38:12 -0700 (MST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uALFco9j40042574; Mon, 21 Nov 2016 15:38:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 102D5AC05E;
 Mon, 21 Nov 2016 10:38:50 -0500 (EST)
Received: from [9.10.99.167] (unknown [9.10.99.167])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id D16FCAC051;
 Mon, 21 Nov 2016 10:38:49 -0500 (EST)
Subject: Re: Jenkins job for per-repository CI
To: Joel Stanley <joel@jms.id.au>
References: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
 <CACPK8Xd10-XSAsqBGhyaKQYfA0YLNZ00qFuW_ocASkXZA=qd_Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Geissler <geissonator@gmail.com>
From: Matt Barth <msbarth@linux.vnet.ibm.com>
Date: Mon, 21 Nov 2016 09:39:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd10-XSAsqBGhyaKQYfA0YLNZ00qFuW_ocASkXZA=qd_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112115-0020-0000-0000-00000A4E9375
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006117; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00783466; UDB=6.00378354; IPR=6.00561085; 
 BA=6.00004898; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013396; XFM=3.00000011;
 UTC=2016-11-21 15:38:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112115-0021-0000-0000-0000577346BB
Message-Id: <5eaf3cc0-2da9-dbeb-b641-92436b647b1d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-21_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611210271
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
X-List-Received-Date: Mon, 21 Nov 2016 15:39:07 -0000

Hey Joel,

On 11/20/2016 06:47 PM, Joel Stanley wrote:
> Hi Matt,
>
> You need to set your username in Thunderbird. I also recommend not top
> posting and disabling HTML mail when sending to mailing lists.
>
Thanks for the pointers, think I fixed things on this now.
> On Sat, Nov 19, 2016 at 8:09 AM, Andrew Geissler <geissonator@gmail.com> wrote:
>> Matt Barth is working a story to use his new auto tools capabilities
>> in each of our repo's to do "make check" calls when code is committed.
>
> Cool! I assume make check will be used by developers on the local
> machines too. I think it's important that our development process is
> as frictionaless as possible. To that end, someone should be able to
> git clone && autoreconf && ./configure && make check wherever
> possible.
>
Correct, this should be able to be done by developers on local machines 
within a x86_64(most likely) SDK or without a SDK if all the 
dependencies are met.
> This is harder for projects that have cross-project dependencies. How
> are you handling these cases?
>
At this time, the dependencies will be up to the developer when 
attempting to run locally(SDK or not). There's likely some work still to 
be done here where ./configure should report any missing dependencies 
for the developer to correct.
On the Jenkins automation side, I'm working on a script to parse 
configure.ac in determining what dependencies need to be installed 
within the docker image prior to running the unit tests. This is a work 
in progress at the moment and will possibly cause updates to each repo's 
configure.ac file to better define the dependencies.
> Do you have any code for us to look at?
>
There's a couple commits in gerrit for the Jenkin's scripts to build and 
run the docker image and I'm working on the script that runs within the 
docker image to determine these dependencies now.
https://gerrit.openbmc-project.xyz/#/c/1103/
https://gerrit.openbmc-project.xyz/#/c/1230/
> Cheers,
>
> Joel
>
Matt
