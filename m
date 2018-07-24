Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Zqlg6JHHzDrH0
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 06:31:59 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6OKTYO9023511
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 16:31:57 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ke7nhh58q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 16:31:56 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 24 Jul 2018 16:31:55 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Jul 2018 16:31:52 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6OKVp7Z17105308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Jul 2018 20:31:51 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D2EE112066;
 Tue, 24 Jul 2018 16:31:37 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD372112061;
 Tue, 24 Jul 2018 16:31:36 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Jul 2018 16:31:36 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 24 Jul 2018 15:38:05 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Sai Dasari <sdasari@fb.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, Patrick Venture
 <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: In-Band Firmware Update
In-Reply-To: <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
 <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18072420-0068-0000-0000-0000031CDDF7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009424; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01065595; UDB=6.00547393; IPR=6.00843453; 
 MB=3.00022306; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-24 20:31:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18072420-0069-0000-0000-000045258A5F
Message-Id: <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-24_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807240216
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2018 20:32:00 -0000

On 2018-07-23 19:13, Sai Dasari wrote:

> Any thoughts on reusing/leveraging the PICMG's hpm spec @
> https://www.picmg.org/openstandards/hardware-platform-management/ .
> One of the benefit would be the standard 'ipmitool' has native support
> for the update and changes are limited to BMC f/w.
> On a downside, the firmware binary has to be repackaged as .hpm format
> for this protocol to do some preparation steps as it support multiple
> f/w components in a single package.

This was brought up a few months ago and decided against:
https://lists.ozlabs.org/pipermail/openbmc/2017-November/009938.html

We are going to investigate using the DFU protocol, as that
also has host side tools already available.


> 
>     --Vernon
