Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcrfq3hZ4zDvhH
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 05:17:55 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBCIEmZX053484
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 13:17:53 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 279tcj5jsv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 13:17:53 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 12 Dec 2016 11:17:52 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 12 Dec 2016 11:17:50 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id DA8C73E40044;
 Mon, 12 Dec 2016 11:17:49 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBCIHnor15335726; Mon, 12 Dec 2016 11:17:49 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA5526A03F;
 Mon, 12 Dec 2016 11:17:49 -0700 (MST)
Received: from [9.10.99.99] (unknown [9.10.99.99])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 7F7D56A03D;
 Mon, 12 Dec 2016 11:17:49 -0700 (MST)
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Joel Stanley <joel@jms.id.au>
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
 <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
 <57E54486.6020304@raptorengineeringinc.com>
 <de14e2a8-06f3-19f9-c783-3d05e6856993@linux.vnet.ibm.com>
 <CACPK8XfZ=yHgx75xBgy8kyQqxpCLwW406hyKvQYfiBpnC6Hvqw@mail.gmail.com>
 <584ED13B.8050206@raptorengineeringinc.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 12 Dec 2016 12:17:48 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <584ED13B.8050206@raptorengineeringinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16121218-0004-0000-0000-000011106753
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006237; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000196; SDB=6.00792866; UDB=6.00384337; IPR=6.00570667; 
 BA=6.00004959; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013608; XFM=3.00000011;
 UTC=2016-12-12 18:17:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16121218-0005-0000-0000-00007B56AFF1
Message-Id: <a5f21dcd-9ab5-68f1-c65c-46600e5d0e33@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-12_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612120273
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
X-List-Received-Date: Mon, 12 Dec 2016 18:17:55 -0000

Hi Tim,


On 12/12/2016 10:32 AM, Timothy Pearson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12/11/2016 05:36 PM, Joel Stanley wrote:
>> Hi Matt,
>>
>> On Sat, Dec 10, 2016 at 2:55 AM, Matt Spinler
>> <mspinler@linux.vnet.ibm.com> wrote:
>>> Hi,
>>>
>>> We're getting closer to needing the hwmon driver for this.  Has anyone heard
>>> an outlook?
> There is a functional driver merged into the OpenBMC kernel tree.
> Upstream is still working on a replacement driver as far as I know; they
> just wanted a different internal implementation of the driver versus the
> one in the OpenBMC kernel tree.

Your driver is a hwmon driver, so it will make an entry in 
/sys/class/hwmon?  I realized after
I sent this email that the chip wasn't specified in the device tree, so 
it wasn't going to show
up anywhere even if it was.


> - -- 
> Timothy Pearson
> Raptor Engineering
> +1 (415) 727-8645 (direct line)
> +1 (512) 690-0200 (switchboard)
> https://www.raptorengineering.com
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iQEcBAEBAgAGBQJYTtE7AAoJEK+E3vEXDOFbI/IIAJ7ZnMhqd3EyhBLrFXSBA18c
> 2z5tAH8iLVYns0/CL9p5vyqs6k5emc5EBAxwfw3NxE+nlXHB2khcZBJgWWA9+ZdR
> pbV8ChnmPgyphHg8P2t3UEvEkqwL1hOQHEx7V8pdvC/9JRbWBDgaIsdLJViZL1gQ
> AibLhFb0QflLLVKR3txvZadF66w6SyOCN6parT0u/6c/VanxranuQVFOqIn3MVSn
> DOpf7fX0MLe3ripJCXe2nZ+OdvjFxlNHfs2rUKl7JVDJzJU36i2PD9xMvkGzadBd
> +USdbrD9j6D5QuSHXOyIc6ij2kMVCjNuzW083l0BxUeXZkyolBh3uYu7/S7qf9E=
> =k1Ld
> -----END PGP SIGNATURE-----
>
