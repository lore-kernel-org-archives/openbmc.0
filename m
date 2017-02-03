Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFMrj14fgzDqBX
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 03:34:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v13GXhSt110875
 for <openbmc@lists.ozlabs.org>; Fri, 3 Feb 2017 11:34:11 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28c90960ed-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 Feb 2017 11:34:10 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 3 Feb 2017 11:34:09 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 3 Feb 2017 11:34:06 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id AE11E6E804B;
 Fri,  3 Feb 2017 11:33:37 -0500 (EST)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v13GY5xQ36241424; Fri, 3 Feb 2017 16:34:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7348C11205E;
 Fri,  3 Feb 2017 11:34:05 -0500 (EST)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id CA5D0112062;
 Fri,  3 Feb 2017 11:34:04 -0500 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Feb 2017 10:36:12 -0600
From: eajames <eajames@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Alistair Popple
 <alistair@popple.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Edward A. James" <eajames@us.ibm.com>, joel.stan@gmail.com
Subject: Re: [PATCH linux v1 0/8] drivers: fsi: interrupt polling, i2c client
In-Reply-To: <CACPK8XeAONcgX=y1fJueOkqXBiHeQDRf0zXp2XFJFXjU=wNgKw@mail.gmail.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeAONcgX=y1fJueOkqXBiHeQDRf0zXp2XFJFXjU=wNgKw@mail.gmail.com>
X-Sender: eajames@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020316-0044-0000-0000-000002771730
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006549; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816720; UDB=6.00398864; IPR=6.00594156; 
 BA=6.00005114; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014169; XFM=3.00000011;
 UTC=2017-02-03 16:34:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020316-0045-0000-0000-000006A41A72
Message-Id: <ca4162fcc8baaa60b48a1dfd3d9cf4d5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-03_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702030158
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
X-List-Received-Date: Fri, 03 Feb 2017 16:34:13 -0000

On 2017-02-02 18:55, Joel Stanley wrote:
> On Fri, Feb 3, 2017 at 9:55 AM,  <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>> 
>> First, this series add interrupt polling support to the FSI bus 
>> driver.
>> This implements a loop that constantly polls the FSI slave interrupt
>> status register and triggers any registered client interrupt handlers 
>> upon
>> detecting an interrupt.
>> 
>> Secondly, this series adds the I2C client driver for FSI bus. This 
>> driver
>> interacts with the IBM BOE engine on an FSI slave device.
>> 
>> Christopher Bostic (3):
>>   drivers/fsi: Add slave interrupt polling
>>   drivers/fsi: Add Client IRQ Enable / Disable
>>   drivers/fsi: Add sysfs file to adjust i-poll period
>> 
>> Edward A. James (5):
>>   drivers: fsi: Add i2c client driver
>>   drivers: fsi: i2c: Add engine access wrappers
>>   drivers: fsi: i2c: probe fsi device for i2c client
>>   drivers: fsi: i2c: add driver file operations and bus locking
>>   drivers: fsi: i2c: boe engine
> 
> This series was a bit of a mess. The second 5 patches all had trailing
> whitespace. They didn't build cleanly. These patches had different
> subject prefxies too. You can generate the subject line like this:
> 
> git format-patch --subject-prefix "PATCH linux dev-4.7" and it will
> spit out patch files with the same subject prefix on all patches.
> 
> If you're doing v2, you can do:
> 
> git format-patch -v 2  --subject-prefix "PATCH linux dev-4.7" and it
> will add the v2 or v3 or v100 to your subject line.
> 
> The full incarnation might look like this:
> 
> git format-patch -v 2  --subject-prefix "PATCH linux dev-4.7"
> --to=joel@jms.id.au --cc=openbmc@lists.ozlabs.org origin/dev-4.7 -o
> fsi-patches-v2
> 
> And then once you've edited the cover letter, I do this:
> 
> git send-email fsi-patches-v2/*
> 
> I fixed the mess this time, but please make sure you're sending
> patches that cleanly apply and don't introduce warnings next time.
> 
> Cheers,
> 
> Joel

Thanks Joel, my apologies for the dirty patch set. I spent no effort 
cleaning anything up from the FSP code since this is a temporary 
measure. As for the subject prefixes, Chris generated the first three 
and I generated the last 5, so I didn't realize they had different 
subjects before I sent them out. Won't happen again. Looking forward to 
working on the new i2c driver.

Thanks,
Eddie

> 
>> 
>>  drivers/fsi/Kconfig           |    6 +
>>  drivers/fsi/Makefile          |    1 +
>>  drivers/fsi/fsi-core.c        |  170 +++
>>  drivers/fsi/fsi-master-gpio.c |    1 +
>>  drivers/fsi/fsi-master.h      |    2 +
>>  drivers/fsi/i2c/Makefile      |    1 +
>>  drivers/fsi/i2c/iic-boe.c     | 1597 +++++++++++++++++++++++++++++
>>  drivers/fsi/i2c/iic-boe.h     |  180 ++++
>>  drivers/fsi/i2c/iic-fsi.c     |  715 +++++++++++++
>>  drivers/fsi/i2c/iic-int.h     |  395 +++++++
>>  drivers/fsi/i2c/iic-lock.c    |  439 ++++++++
>>  drivers/fsi/i2c/iic-mstr.c    | 2281 
>> +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/fsi.h           |    5 +
>>  include/uapi/linux/Kbuild     |    1 +
>>  include/uapi/linux/i2cfsi.h   |  136 +++
>>  15 files changed, 5930 insertions(+)
>>  create mode 100644 drivers/fsi/i2c/Makefile
>>  create mode 100644 drivers/fsi/i2c/iic-boe.c
>>  create mode 100644 drivers/fsi/i2c/iic-boe.h
>>  create mode 100644 drivers/fsi/i2c/iic-fsi.c
>>  create mode 100644 drivers/fsi/i2c/iic-int.h
>>  create mode 100644 drivers/fsi/i2c/iic-lock.c
>>  create mode 100644 drivers/fsi/i2c/iic-mstr.c
>>  create mode 100644 include/uapi/linux/i2cfsi.h
>> 
>> --
>> 1.8.3.1
>> 
