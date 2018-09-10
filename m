Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Z8DXYvCk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iRyNwZRu"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4280HL5bTwzF3By
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 17:37:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DACE821B01;
 Mon, 10 Sep 2018 03:36:56 -0400 (EDT)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Mon, 10 Sep 2018 03:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=KSuIO+dyb+JIIGjcZGH2qIqmHxQGg
 LkoQ2mV9Cwi/ZE=; b=Z8DXYvCkN32rALdwhTGZBGiWwBSfqMpDWGv5deBr2jfS+
 fCOdL/0CPDQVMwRIVLq0MwUtw86/ddbNAPuQMR0aXYbu40ABU73YQINXzX/kFESz
 CTWfT3hr+otXvwX5nTZAqisBKYBvhtSI58cWELKu3vf12jyKvDIbiOAP0GChlqqt
 rISpA5IGrgf0H49zLp68atSVQq6cE12qQfruu/wBZC+RyXUioHCIzviBbrMlsY7t
 qODPrkxE5cSAkbGY6wIfmabHfkiT1yj7S4fR5wDszN4m/ZrrezjoVfI4AdotsmD3
 psyI3SH29BMrkjsF9MQVlu8n4XgfKwJvOrhzu6jXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KSuIO+
 dyb+JIIGjcZGH2qIqmHxQGgLkoQ2mV9Cwi/ZE=; b=iRyNwZRunivtWblB8pLR5Y
 O9vZKjSFpC0dr00i5dLrBUCPi92B5u0vMITFmqhtwuqAByQ7WsuEqSItzG2fqAVX
 5EzyKhgByse/lQW2YhC+wCAqo5s2oLkTyc1fPouKMOkzLhmoPW0plK7ZEIbxve6y
 GCK3jvC1nzsgFi0rlEl0rqpLvBEUf/9STOqftYyKMlGd3kN3qFlY2Z8eUWPznPl6
 tXlFl6A+sati3RgwSaOWTMhM738iccFNQP9wZAn6soyJe0GP6VMNqJu1obyd48sO
 DO2tlpkOSZl949KhTb0Sj31+w/CNb+dDzOBb0FBXomlZJCyyNtSxWcLsS4M15fxw
 ==
X-ME-Proxy: <xmx:GB-WW74pm8NDQ09s2EeuTFDWainCbo3foRwdQ34ZRpuG6x0cpJVpHg>
 <xmx:GB-WW2rcvF6ZWGGFcHRGSGP0gZoLzjd43FRaHfEerok6FsqXuxQKsA>
 <xmx:GB-WW77Ctx7zHDFRM1mLgi3C14fZMP4n-ATREYJUn_mk_8eN3O8AeQ>
 <xmx:GB-WWxN3NSjRMFM8ldga-h3itCJIee7-ESdQW_3e652cYqkeW8ucCA>
 <xmx:GB-WW59cSAxw41EuON3ZKgNcXOYfNG5F5hOvwc4Af-gungjTqAjQXw>
 <xmx:GB-WW5QOw2If9IKYWsvoJgqFmzE8Mv-Z67RkWgAmzvgJNx2mPEcEDQ>
X-ME-Sender: <xms:GB-WWz-0viNrspxBKNHpOOpOM1khBM7dAF9SGhSWnFf3df15IVdWHw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id E545062674; Mon, 10 Sep 2018 03:36:55 -0400 (EDT)
Message-Id: <1536565015.72467.1502515344.359BB453@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: "Wang, Kuiying" <kuiying.wang@intel.com>,
 Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@yahoo.com>, chunhui.jia@linux.intel.com,
 kunyi731@gmail.com, "Mihm, James" <james.mihm@intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, "Feist, James" <james.feist@intel.com>, "Jia,
 Chunhui" <chunhui.jia@intel.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Li,
 Yong B" <yong.b.li@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>,
 "Xu, Qiang" <qiang.xu@intel.com>, "Nguyen, Hai V" <hai.v.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1234af23
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249E0F1FA@shsmsx102.ccr.corp.intel.com>
Date: Mon, 10 Sep 2018 17:06:55 +0930
Subject: Re: [PATCH linux dev-4.18] ASPEED: dts: Define the gpio-line-names
 property for aspeed-g5
References: <959CAFA1E282D14FB901BE9A7BF4E77249E0F1FA@shsmsx102.ccr.corp.intel.com>
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
X-List-Received-Date: Mon, 10 Sep 2018 07:37:06 -0000

Hi Kuiying,

On Mon, 10 Sep 2018, at 16:57, Wang, Kuiying wrote:
> Gpio-line-names property of aspeed-g5 is not defined in the upstream submission.
> It is required by new gpio API "linux/gpio.h"
> 
> commit 9dfd72ff5f628d7aaa10728756ce42bd5f768d4f (HEAD -> dev-4.18)
> Author: Kuiying Wang <kuiying.wang@intel.com>
> Date:   Fri Sep 7 18:01:41 2018 +0800
> 
>     Define the gpio-line-names property for aspeed-g5
> 
>     Based on aspeed AST-2500 Datasheet spec, there are 232 gpios.
>     So defines the gpio line name from "A0" to "AC7".
> 
>     Signed-off-by: Kuiying Wang <kuiying.wang@intel.com>
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/
> aspeed-g5.dtsi
> index d92f047907de..6d664f4f1621 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -265,6 +265,36 @@
>                                 gpio-ranges = <&pinctrl 0 0 220>;
>                                 clocks = <&syscon ASPEED_CLK_APB>;
>                                 interrupt-controller;
> +                             gpio-line-names = 
> "A0","A1","A2","A3","A4","A5","A6","A7",
> +                                   
> "B0","B1","B2","B3","B4","B5","B6","B7",
> +                                   
> "C0","C1","C2","C3","C4","C5","C6","C7",
> +                                   
> "D0","D1","D2","D3","D4","D5","D6","D7",
> +                                   
> "E0","E1","E2","E3","E4","E5","E6","E7",
> +                                   
> "F0","F1","F2","F3","F4","F5","F6","F7",
> +                                   
> "G0","G1","G2","G3","G4","G5","G6","G7",
> +                                   
> "H0","H1","H2","H3","H4","H5","H6","H7",
> +                                   
> "I0","I1","I2","I3","I4","I5","I6","I7",
> +                                   
> "J0","J1","J2","J3","J4","J5","J6","J7",
> +                                   
> "K0","E1","E2","E3","E4","E5","E6","E7",
> +                                   
> "L0","L1","L2","L3","L4","L5","L6","L7",
> +                                   
> "M0","M1","M2","M3","M4","M5","M6","M7",
> +                                   
> "N0","N1","N2","N3","N4","N5","N6","N7",
> +                                   
> "O0","O1","O2","O3","O4","O5","O6","O7",
> +                                   
> "P0","P1","P2","P3","P4","P5","P6","P7",
> +                                   
> "Q0","Q1","Q2","Q3","Q4","Q5","Q6","Q7",
> +                                   
> "R0","R1","R2","R3","R4","R5","R6","R7",
> +                                   
> "S0","S1","S2","S3","S4","S5","S6","S7",
> +                                   
> "T0","T1","T2","T3","T4","T5","T6","T7",
> +                                   
> "U0","U1","U2","U3","U4","U5","U6","U7",
> +                                   
> "V0","V1","V2","V3","V4","V5","V6","V7",
> +                                   
> "W0","W1","W2","W3","W4","W5","W6","W7",
> +                                   
> "X0","X1","X2","X3","X4","X5","X6","X7",
> +                                   
> "Y0","Y1","Y2","Y3","Y4","Y5","Y6","Y7",
> +                                   
> "Z0","Z1","Z2","Z3","Z4","Z5","Z6","Z7",
> +                                   
> "AA0","AA1","AA2","AA3","AA4","AA5","AA6","AA7",
> +                                   
> "AB0","AB1","AB2","AB3","AB4","AB5","AB6","AB7",
> +                                   
> "AC0","AC1","AC2","AC3","AC4","AC5","AC6","AC7"
> +                             ;
>                         };

I have to say I don't find this terribly useful. It's much better if the platform DTS adds a name that captures the semantic meaning of the line rather than simply indicating its position in a bank. It's pretty straight forward to convert between the raw index and the "bank name" (e.g. GPIOV3). If it helps Joel wrote a little python script for it:

https://github.com/shenki/aspeed-kernel-tests/blob/master/num-to-gpio

Cheers,

Andrew
