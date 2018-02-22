Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQpr0vyRzF1d7
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:25:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKPaaL137301
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:25:52 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga2pjn0hy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:25:51 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:25:51 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:25:48 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKPmHq12648860; Thu, 22 Feb 2018 13:25:48 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ED94C6037;
 Thu, 22 Feb 2018 13:25:48 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 3B417C6042;
 Thu, 22 Feb 2018 13:25:47 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 01/16] dts: fsi: Make OCC description match
 expected hierarchy
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-2-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:25:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0016-0000-0000-0000084C7FE9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993585; UDB=6.00504882; IPR=6.00772925; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:25:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0017-0000-0000-00003D94501B
Message-Id: <84dc8db8-ba52-28a4-260e-0c47cf579f80@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802220256
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 20:25:56 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> ibm,p9-occ-hwmon describes a driver, not hardware, but this compatible is
> what's required to get the driver to probe.
>
> While we discuss how to resolve that problem, lets at least make the current
> configuration work.

I already have a possible solution in my patch "drivers: occ: Create 
hwmon platform device directly"
that does away with dts entries for the hwmon driver. Open to feedback, 
but it will obviously conflict with this patch.

Thanks,
Eddie

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   arch/arm/boot/dts/ibm-power9-cfam.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> index e0e738f9e539..215cc8182ca5 100644
> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -113,8 +113,12 @@
>   			#size-cells = <0>;
>
>   			occ@1 {
> -				compatible = "ibm,p9-occ-hwmon";
> +				compatible = "ibm,p9-occ";
>   				reg = <1>;
> +
> +				occ-hwmon@1 {
> +					compatible = "ibm,p9-occ-hwmon";
> +				};
>   			};
>   		};
>
> @@ -205,8 +209,12 @@
>   					#size-cells = <0>;
>
>   					occ@2 {
> -						compatible = "ibm,p9-occ-hwmon";
> +						compatible = "ibm,p9-occ";
>   						reg = <2>;
> +
> +						occ-hwmon@2 {
> +							compatible = "ibm,p9-occ-hwmon";
> +						};
>   					};
>   				};
>   			};
