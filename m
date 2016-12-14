Return-Path: <arnd@arndb.de>
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdr972d64zDt0p
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 19:59:06 +1100 (AEDT)
Received: from wuerfel.localnet ([78.43.21.235]) by mrelayeu.kundenserver.de
 (mreue004 [212.227.15.129]) with ESMTPSA (Nemesis) id
 0M4Vjc-1cXnuw1Z9g-00yiET; Wed, 14 Dec 2016 09:55:54 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Wed, 14 Dec 2016 09:55:47 +0100
Message-ID: <3917905.e4iOqADnVQ@wuerfel>
User-Agent: KMail/5.1.3 (Linux/4.4.0-34-generic; KDE/5.18.0; x86_64; ; )
In-Reply-To: <1481702104-8617-5-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K0:Tu0uKw82SAn4JfyrK+qzwwOMJMOZQUjjzvlIumafn4lvwXwNc4Q
 2vEo6Ba7FsRsgsEO3i/A3mf0w95WSO/DBYVXnEbUeoCRrp6R97gWLh2KA8bsTMkC1Nii2LN
 RZh9uTXrRHjS1SxyWfk7hBdHQqZieGNWWdREKR2HRuE3EYOHutRX0Ey0i7I8l/5AH9V5WTB
 79rI4A0V34vuAl8bXqk3A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:fkqplLqGcxk=:QUtOAxGwWUrEoWSZD/yrpt
 VPXaQAF7fIIp1U0T3j4t4iSQZm0Anq12yZE+zHtzT2ldSwz8A8A6fY5IYVr488vtNy3nrjH/Q
 mzhpbv30eqk2GJj/9S534iEgChEgdZO75/q0o3v/2TZdsnt6L/MzR1UQeAQP+xuCcCVRVipmd
 aEHA3Rhzr59emqMe2KVyOt1ru68LPycB9+cL/PJEOgoXqxWR9LuPFhmDgcunnk/wyBpzYQqn2
 miRn07+mpsOPX6uXV92FpCJCS0vErApI2qJLkAasVIIPfeXu4x5ZhwN+9lRYSUB0UwTn8Tkbb
 DIS+51F+tJ+47N00uRBuSXsbQSDLGCwMeSdYEgSUTWeFRao9ref6M/QyjyhAvdU4UOzQIdxuQ
 h0LhHfsYob3VE6bUFQyVGRgBG+2s2HX0FpZ5rZD02JVQIw5Ays+uzapUpBbNxd5joRWwYZ1Pm
 WMSTKyXbyMoN17pigDWsTLpjqcYd7Sv99Pl3JRfuThdtxtiIHlijd3guxtHjL9+wVL21eA+0Z
 O7Tbptwd5fIwQRrSZcjGDwqnjFcjGDMSUd8gUejceGG6dNB4dkoITQxYle08Meb6ST2znIPiG
 WkINyFGjBvN33CxOjlREUVZfjg+vz2W0jAgHvAVkGqyG2Q50BtLDQDjZj4GDh3I7mbjyyGJmr
 oCiEM+HzfO53ZnS1ruSD+6E6Vf4744ImG/mY3hUEvqex7XnW1hhoIbW8uI0DONls6ZG8zZzHd
 BW18DdH+/iF4dTR6
X-Mailman-Approved-At: Wed, 14 Dec 2016 20:12:00 +1100
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
X-List-Received-Date: Wed, 14 Dec 2016 08:59:08 -0000

On Tuesday, December 13, 2016 11:55:04 PM CET Jaghathiswari Rankappagounder Natarajan wrote:
> Add clock, data and clear signal GPIO lines to control seven segment display on
> zaius platform.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 8ef4ece..ccb8147 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -43,6 +43,14 @@
>  			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +
> +	seven-seg-disp {
> +		compatible = "seven-seg-gpio-dev";
> +		refresh-interval-ms = "1000";
> +		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +	};
>  };


According to your introductory mail, the interface is assumed to be
a 74HC164. Should we use that ID in the compatible string?

We can always add other strings later if we want to support multiple
wire formats.

	Arnd
