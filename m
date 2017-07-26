Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHpHR6XTMzDqmc
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 07:32:51 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6QLTov4098086
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 17:32:48 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bxy1x46aa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 17:32:48 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 26 Jul 2017 17:32:47 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 26 Jul 2017 17:32:46 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6QLWj3t22806718; Wed, 26 Jul 2017 21:32:45 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 912A4AE03C;
 Wed, 26 Jul 2017 17:32:57 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 51E19AE034;
 Wed, 26 Jul 2017 17:32:57 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v4] ARM: dts: aspeed: Add gpio-keys-polled
 for fan presence
To: Joel Stanley <joel@jms.id.au>
References: <20170720141500.57756-1-cbostic@linux.vnet.ibm.com>
 <CACPK8Xf8kESrtgjDUqddLxrV7r+qL4goSBHcps3N6=Yf6h5+4Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 26 Jul 2017 16:32:44 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf8kESrtgjDUqddLxrV7r+qL4goSBHcps3N6=Yf6h5+4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072621-2213-0000-0000-000002000B5F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007431; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893328; UDB=6.00446595; IPR=6.00673492; 
 BA=6.00005492; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016395; XFM=3.00000015;
 UTC=2017-07-26 21:32:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072621-2214-0000-0000-00005702718F
Message-Id: <fd82c4f9-41f2-24b7-08c1-1ff6550677fc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707260314
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
X-List-Received-Date: Wed, 26 Jul 2017 21:32:52 -0000



On 7/26/17 7:14 AM, Joel Stanley wrote:
> Hi Chris,
>
> On Thu, Jul 20, 2017 at 11:45 PM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> +       gpio-keys-polled {
>> +               compatible = "gpio-keys-polled";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               #poll-interval = <1000>;
> When I tested it, I saw this:
>
> [    3.630000] gpio-keys-polled gpio-keys-polled: missing poll_interval value
> [    3.630000] gpio-keys-polled: probe of gpio-keys-polled failed with error -22
>
> I fixed that property, and I got this:
>
> [    3.620000] OF: /gpio-keys-polled/fan0-presence: could not get
> #gpio-cells for /ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60
> [    3.620000] gpio-keys-polled gpio-keys-polled: failed to get gpio: -22
> [    3.620000] gpio-keys-polled: probe of gpio-keys-polled failed with error -22
Sorry about that -missed the probe error, will fix.


Thanks,
Chris


> So I added the gpio-cells to the relevant node, and it probed properly.
>
> Can you please make those two fixes and test that the input events
> work as you expected?
>
> Cheers,
>
> Joel
>
