Return-Path: <vishwa@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wKxM30GFzDqRd
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 01:11:31 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x17E6vPG041402
 for <openbmc@lists.ozlabs.org>; Thu, 7 Feb 2019 09:11:29 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qgmga5jr5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Feb 2019 09:11:29 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 7 Feb 2019 14:11:27 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Feb 2019 14:11:26 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x17EBPaW41418964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 7 Feb 2019 14:11:25 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 287FC52073;
 Thu,  7 Feb 2019 14:11:25 +0000 (GMT)
Received: from [9.102.27.47] (unknown [9.102.27.47])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E12D45204F;
 Thu,  7 Feb 2019 14:11:23 +0000 (GMT)
Subject: Re: LED not Blinking
To: AKASH G J <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
References: <CAE33tLEsh+Oh8LYY0tkO98tVzVDjZwbxO9J49zp2fAWz_dysbQ@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 7 Feb 2019 19:41:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAE33tLEsh+Oh8LYY0tkO98tVzVDjZwbxO9J49zp2fAWz_dysbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19020714-0012-0000-0000-000002F2E8FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020714-0013-0000-0000-0000212A4E84
Message-Id: <36412c28-646b-0ae6-268d-824eccafd3eb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-07_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=736 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902070109
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
X-List-Received-Date: Thu, 07 Feb 2019 14:11:36 -0000

Hi,

On 2/4/19 5:48 PM, AKASH G J wrote:
> Hi all,
>
> We have a board containing BMC Aspeed AST-2500. One LED is connected 
> to GPIO-E0. I am using zaius machine configuration for building the 
> image. I want that LED to blink after BMC is booted. So I changed the 
> following files.
>
> Patched the device tree file aspeed-bmc-opp-zaius.dts
>
>  leds {
>             compatible = "gpio-leds";
> +        power {
> +            gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
> +        };
>   };
>
>
> Added the following configuration to sensor inventory file 
> openbmc/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml
>
> bmc_booted:
>     power:
>         Action: 'Blink'
>         DutyOn: 50
>         Period: 1000
>         Priority: 'On'
>

You would need to put this in led.yaml and that would get compiled into 
phosphor-led-manager as led-gen.hpp. Please see this as an example.

https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/recipes-phosphor/leds/romulus-led-manager-config/led.yaml

!! Vishwa !!

The LED is glowing when the BMC boots up. But it is not blinking. Please 
someone help to resolve the issue.
Thanks in advance.
