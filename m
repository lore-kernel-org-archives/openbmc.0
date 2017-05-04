Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJnYK2YkqzDqBJ
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 07:03:01 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v44KrnnU016113
 for <openbmc@lists.ozlabs.org>; Thu, 4 May 2017 17:02:45 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a8br20ahy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 May 2017 17:02:45 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 4 May 2017 17:02:43 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 4 May 2017 17:02:40 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v44L2e1o54657164; Thu, 4 May 2017 21:02:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2BBCAC041;
 Thu,  4 May 2017 17:02:29 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 9503BAC03A;
 Thu,  4 May 2017 17:02:29 -0400 (EDT)
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
To: Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 4 May 2017 16:02:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17050421-0036-0000-0000-000001FB648D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007022; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00856259; UDB=6.00423885; IPR=6.00635459; 
 BA=6.00005326; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015308; XFM=3.00000014;
 UTC=2017-05-04 21:02:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050421-0037-0000-0000-000040357347
Message-Id: <eb310c6a-0b41-aecd-2ae5-025a8f64b152@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-04_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705040300
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
X-List-Received-Date: Thu, 04 May 2017 21:03:01 -0000

On 05/02/2017 12:55 AM, Jeremy Kerr wrote:
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
>
> The FSI core will be responsible for matching probed slaves & engines to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.
>
> RFC at this stage, so I'd welcome any feedback.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
> +
> +Full example
> +------------
> +
> +    /* The GPIO-based FSI master node, describing the top level of the
> +     * FSI bus
> +     */
> +    gpio-fsi {
> +        compatible = "fsi-master-gpio", "fsi-master";
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        /* A FSI slave (aka. CFAM) at link 0, ID 0. */
> +        cfam@0,0 {
> +            reg = <0 0>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            /* FSI engine at 0xc00, using a single page. In this example,
> +             * it's an I2C master controller, so subnodes describe the
> +             * I2C bus.
> +             */
> +            i2c-controller@c00 {
> +                reg = <0xc00 0x400>;
> +
> +                /* Engine-specific data. In this case, we're describing an
> +                 * I2C bus, so we're conforming to the generic I2C binding
> +                 */
> +                compatible = "ibm,fsi-i2c";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                /* I2C endpoint device: an Atmel EEPROM */
> +                eeprom@50 {
> +                    compatible = "atmel,24c256";
> +                    reg = <0x50>;
> +                    pagesize = <64>;
> +                };

I have no problem with this as an example, but it isn't exactly how the 
tree will look under the p8/p9 fsi-attached i2c master. We will instead 
need a list of ports on the master. Then you could put actual devices 
(eeproms, etc) under the ports if desired.

Looks like good documentation to me though. This is working well for my 
I2C driver in combination with your latest FSI patches, Jeremy.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

> +            };
> +        };
> +    };
