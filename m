Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Trr30BXzDt1D
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:50:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA4HmjBv124323
 for <openbmc@lists.ozlabs.org>; Fri, 4 Nov 2016 13:50:34 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26gsfu1wnu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 13:50:34 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 4 Nov 2016 11:50:33 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 4 Nov 2016 11:50:31 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D04D1C40001;
 Fri,  4 Nov 2016 11:50:10 -0600 (MDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA4HoOus10748274; Fri, 4 Nov 2016 17:50:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78C5228057;
 Fri,  4 Nov 2016 13:50:30 -0400 (EDT)
Received: from [9.124.217.99] (unknown [9.124.217.99])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id B4FEF2803A;
 Fri,  4 Nov 2016 13:50:27 -0400 (EDT)
Subject: Re: IPMI LAN command story design - try 3rd send
To: Patrick Williams <patrick@stwcx.xyz>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
Cc: Li Nan <william.bjlinan@hotmail.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Fri, 4 Nov 2016 23:20:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20161104141455.GE17105@heinlein.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16110417-0016-0000-0000-00000515546A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006033; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00776762; UDB=6.00373702; IPR=6.00553909; 
 BA=6.00004857; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013216; XFM=3.00000011;
 UTC=2016-11-04 17:50:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16110417-0017-0000-0000-0000345C0C4A
Message-Id: <581CCA61.4010202@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-04_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611040332
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
X-List-Received-Date: Fri, 04 Nov 2016 17:50:36 -0000

Hi Patrick,

In the IPMI command flow that Nan mentioned in the earlier mail. Any of 
the following ipmitool command for
setting the IPv4 configuration, one of the step is to 'Commit 
Write'(Step 8 in Nan's mail).

ipmitool lan set 1 ipaddr x.x.x.x
ipmitool lan set 1 netmask x.x.x.x
ipmitool lan set 1 defgw ipaddr x.x.x.x

As part of the execution of any of the above commands a commit write is 
executed. In that case we cannot use
'Commit Write' as a way to denote the completion of a transaction.

The IPMI specification expects the IP configuration parameters as 
non-volatile parameters. The commit write
parameter is a way to implement rollback feature. The BMC would make a 
copy of the existing parameters
when the 'Set in Progress' state is asserted.

The Get/Set LAN Configuration commands do not provide an option to apply 
the configuration and is identified as
LAN channel settings. The link below used 'Set Channel Access' command 
to apply the settings.
(ipmitool lan set 1 access on). Since LAN configuration parameters are 
channel settings, we thought of
applying the LAN configuration parameters as part of 'Set Channel 
Access'. I am okie if we have
an OEM command to trigger applying the LAN settings.

https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool

In Barreleye we did not implement the 'Set Channel Access' command. 
There was no external
command to trigger apply the settings. In Barreleye the LAN settings are 
applied when all the
three entries(IP Address, Netmask and Gateway address) where set. So 
only to change the
IP address, the netmask and gateway address need to be re-entered, which 
was an imperfect
solution.

Regards,
Tom



On Friday 04 November 2016 07:44 PM, Patrick Williams wrote:
> Tom,
>
> On Fri, Nov 04, 2016 at 06:56:21PM +0530, tomjose wrote:
>> The Set Channel access command was decided to be used to mark the end of
>> a setting LAN configuration transaction.
> The IPMI spec for the SetLanConfig has a parameter 'Set In Progress'
> which states: 10b = commit write.  Why are we not utilizing that?  Maybe
> in addition to Set Channel Access?
>
> I don't see anything in the Set Channel Access command description that
> would be obvious as a mechanism for updating IP addresses.  Was that
> just quick behavior we decided to do for Barreleye?  Is there any reason
> why we would not deprecate that behavior in favor of the Set In
> Progress / commit write?
>
