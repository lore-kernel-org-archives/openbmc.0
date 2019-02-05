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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43v7fl4l0wzDqLV
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 02:24:47 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x15FGscl075939
 for <openbmc@lists.ozlabs.org>; Tue, 5 Feb 2019 10:24:45 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qfb4u6nrh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Feb 2019 10:24:44 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 5 Feb 2019 15:24:43 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Feb 2019 15:24:41 -0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x15FOepx22610026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Feb 2019 15:24:40 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDC35B2064;
 Tue,  5 Feb 2019 15:24:39 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F24DB206A;
 Tue,  5 Feb 2019 15:24:39 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Feb 2019 15:24:39 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Feb 2019 09:31:06 -0600
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: AKASH G J <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: LED not Blinking
In-Reply-To: <CAE33tLHZ6LOa4CtYwYVuKZxgZoNkCzxfNM7LGLQDQfDoww7dww@mail.gmail.com>
References: <CAE33tLEsh+Oh8LYY0tkO98tVzVDjZwbxO9J49zp2fAWz_dysbQ@mail.gmail.com>
 <f9f2f2ecdbfbc94f8a6afcbd7ab06ced@linux.vnet.ibm.com>
 <CAE33tLHZ6LOa4CtYwYVuKZxgZoNkCzxfNM7LGLQDQfDoww7dww@mail.gmail.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19020515-0040-0000-0000-000004BC9BBF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010541; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01156700; UDB=6.00593882; IPR=6.00937219; 
 MB=3.00025445; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-05 15:24:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020515-0041-0000-0000-000008C7B5B8
Message-Id: <5aeeee958a538fe17d5b8ef4416734d8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902050117
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 15:24:48 -0000

On 2019-02-04 22:34, AKASH G J wrote:
> I am using zaius machine configuration. In that led.yaml file is not
> available.
> 

You can add support for that using the guide at
https://github.com/openbmc/docs/blob/master/LED-architecture.md,
and also the Romulus layer has examples.


> On Mon, Feb 4, 2019 at 9:21 PM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
> 
>> On 2019-02-04 06:18, AKASH G J wrote:
>>> Hi all,
>>> 
>>> We have a board containing BMC Aspeed AST-2500. One LED is
>> connected
>>> to GPIO-E0. I am using zaius machine configuration for building
>> the
>>> image. I want that LED to blink after BMC is booted. So I changed
>> the
>>> following files.
>>> 
>>> Patched the device tree file aspeed-bmc-opp-zaius.dts
>>> 
>>> leds {
>>> compatible = "gpio-leds";
>>> + power {
>>> + gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
>>> + };
>>> };
>>> 
>>> Added the following configuration to sensor inventory file
>>> 
>> 
> openbmc/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml
>>> 
>>> bmc_booted:
>>> power:
>>> Action: 'Blink'
>>> DutyOn: 50
>>> Period: 1000
>>> Priority: 'On'
>>> 
>>> The LED is glowing when the BMC boots up. But it is not blinking.
>>> Please someone help to resolve the issue.
>>> 
>> 
>> Hi,
>> 
>> The LEDs are defined in a different file, check out, for example,
>> 
> meta-ibm/meta-romulus/recipes-phosphor/leds/romulus-led-manager-config/led.yaml.
>> 
>> You can tell it should be working when you see a
>> /xyz/openbmc_project/led/groups/bmc_booted object on D-Bus.
>> 
>>> Thanks in advance.
