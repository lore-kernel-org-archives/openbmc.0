Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqkPp6JrQzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 07:14:06 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u96K8pp1125595
 for <openbmc@lists.ozlabs.org>; Thu, 6 Oct 2016 16:14:04 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25wu5g72gq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 16:14:04 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 6 Oct 2016 16:14:03 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Oct 2016 16:14:01 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 03DFE38C8046
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 16:14:01 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u96KE1x812124580
 for <openbmc@lists.ozlabs.org>; Thu, 6 Oct 2016 20:14:01 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BB2D12404C
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 16:14:01 -0400 (EDT)
Received: from [9.10.223.205] (unknown [9.10.223.205])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id DF3E612403D
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 16:14:00 -0400 (EDT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: I2C device driver names
Date: Thu, 6 Oct 2016 15:14:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100620-0044-0000-0000-00000164CBDE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005864; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00765167; UDB=6.00365582; IPR=6.00541020; 
 BA=6.00004791; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012897; XFM=3.00000011;
 UTC=2016-10-06 20:14:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100620-0045-0000-0000-00000591D761
Message-Id: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-06_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610060351
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
X-List-Received-Date: Thu, 06 Oct 2016 20:14:07 -0000

Hi,

As part of my work to generate a device tree from the machine readable 
workbook XML, I need to create I2C device entries, which have the 
compatible properties that need to be filled in.

The following parts are present in the system I'm trying to build, with 
firmware requirements to access them.  I took a stab at the names.  
Could someone doublecheck them and maybe comment on if a driver is 
missing, or maybe if some upcoming work is known that will include it?  
I didn't have much luck finding a lot of these in the 
Documentation/devicetree/bindings directories.

PMBus Power supplies:   ?

MAX31785 fan controller:  max,max31785

BMP280:  bosch,bmp280

TMP4523A temp sensor:  ti,tmp423

TMP275 temp sensor: ti,tmp275

pca9552 IO expander:  nxp,pca9552

UCD90160 power sequencer: ti,ucd90160

RX8900CE RTC:  epson,rx8900ce

24c64 EEPROM:  atmel,24c64

There are also a handful of regulators, but so far I haven't heard of 
any requirements to access them.

Thanks.
