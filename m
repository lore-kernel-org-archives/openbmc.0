Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wB5d6mqSzF3Xp
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 04:17:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2018 09:17:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,233,1539673200"; d="scan'208";a="249692550"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 14 Nov 2018 09:17:53 -0800
Subject: Re: [HELP] ipmi-kcs didn't work
To: qianlihu <wangzhiqiang8906@gmail.com>, openbmc@lists.ozlabs.org
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
Date: Wed, 14 Nov 2018 09:17:53 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 14 Nov 2018 17:17:58 -0000

Hi,

On 11/14/2018 2:38 AM, qianlihu wrote:
> Hi,
> 
> I add ipmi kcs node,but it didn't work
> 
> here is the patch for dts.
> 
>          lpc_bmc: lpc-bmc@0 {
> -               compatible = "aspeed,ast2500-lpc-bmc";
> +               compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";
> +
>                  reg = <0x0 0x80>;
> +               reg-io-width = <4>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x80>;
> +
> +               kcs3: kcs3@0 {
> +                       compatible = "aspeed,ast2500-kcs-bmc";
> +                       reg = <0x0 0x80>;
> +                       interrupts = <8>;
> +                       kcs_chan = <3>;
> +                       kcs_addr = <0xca2>;

Probably, you should add a clock setting for KCS H/W block into here.

	clocks = <&syscon ASPEED_CLK_GATE_LCLK>;

Cheers,

Jae

> +                       status = "disabled";
> +
> +               };
>          };
> 
> +&kcs3 {
>                           +       status = "okay";
>          +};
> 
> 
> The device node /dev/ipmi-kcs3 is created.
> 
> 
> root@sanjose:/tmp# ./kcsbridged --vv --d /dev/ipmi-kcs3
> Debug logging
> Starting
> Registering dbus methods/signals
> Requesting dbus name: org.openbmc.HostIpmi
> Getting dbus file descriptors
> Opening /dev/ipmi-kcs3
> Creating timer fd
> Entering polling loop
> Processed 1 dbus events
> Processed 1 dbus events
> Processed 1 dbus events
> Processed 1 dbus events
> Processed 1 dbus events
> Processed 1 dbus events
> Processed 1 dbus events
> 
> but there is nothing output.
> 
