Return-Path: <maxims@google.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swYJ06qWCzDt3T
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 03:40:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Nqza/jw6; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id w3so77929471ywg.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EsmJFXVN9KU7CwZvofwmN111btSW3qx2yfaP+6N9+jc=;
 b=Nqza/jw6OBmw6vHiLeqakaK6e/mHXvS0hisp4XeBeAiTt7t1K1o5jFnZiby05DSp1a
 ZG2PXNJgLkP1m4AK1mbRG9hrL/ywwqYYZT9DCHR5GpuBIyGd8boSbuIAG0wBZkhwAbsz
 ODHWlmwWnDuZRXIqGa3CJHFY4ZJvKIHVAbEHNGMVzf50toszj8VDLLk3KuTB6ByQ4Wpd
 1uTp4WG4ltkyqh0mG1SNTykhLprX5K8CaQ85N+nqOD2NNtEoKEw5IbJ4PGW/Ron22Yeg
 4Yw6iB1+4wRmSDdBLGbl4rYuAq+xCuwsDZRW+xe9AvjS1MO+C4Fp3n6mkVPmsNvTsEWP
 PYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EsmJFXVN9KU7CwZvofwmN111btSW3qx2yfaP+6N9+jc=;
 b=UztiGo9VR7zUcERXUE9scRaRLmI6FTNXtUDm1ZDWSZtzSAhFKMlI5lVgNmn5ds8cf1
 K3Fy9Njp/o06uHuXrQa2TOyxnZjcrEdzVn+bgGAXVjU9CBgX6CLMbIMB680FkG3bdeI6
 CitRMmDXQnxCmfNZtrXsgRf0FsqK4Llq4CCVBltb6iCIJ2pUOpUcnfjiCBUIjszqIpz2
 vFUfw0Atpx0Eji+YYwcBlS8ps5ZZCKHz/hQ8D/n7TJYGE0S0hhYmKkZkkkW06wO8qTJC
 w1/8tXPNnZu/IBI43ZibKyc+2EENj/YZnZEdCTYLpa7Nh4bJ8C4fqm6Mrg27rwo9bJeY
 xasw==
X-Gm-Message-State: AA6/9RkTojmGv+istFUOVRHLb+RCvAQtqg1AnuACxuAhBxsnI73qk1bGhuDjV9xwLYMRHom9VLCZ0lFcy2x1Cdap
X-Received: by 10.13.192.66 with SMTP id b63mr11222075ywd.161.1476463244796;
 Fri, 14 Oct 2016 09:40:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.210.2 with HTTP; Fri, 14 Oct 2016 09:40:44 -0700 (PDT)
In-Reply-To: <CACPK8XeDtXFZYEnLWS_iuVL46cZOcNkVGViSomvY7HJVJZ+CLA@mail.gmail.com>
References: <1474998214-12720-1-git-send-email-maxims@google.com>
 <1475173974-130879-1-git-send-email-maxims@google.com>
 <CAFR_W8p4nKxHxUDWtS3SxNcqp2sHyt+1eoznssKjTK6RCc=JVg@mail.gmail.com>
 <CAFR_W8odtcmNUjA1uPLZh++pxMt+mOWxSx+6QSUB_ChjUBEqNQ@mail.gmail.com>
 <CACPK8XeDtXFZYEnLWS_iuVL46cZOcNkVGViSomvY7HJVJZ+CLA@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 14 Oct 2016 09:40:44 -0700
Message-ID: <CAFR_W8qVV85A61tf8cgaJ2m++SRJYaEhr+JmRRKjfn89Yfi9uw@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5: Device Tree for ast2500
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>,
 Rick Altherr <raltherr@google.com>
Content-Type: multipart/alternative; boundary=001a114c55003b7a9e053ed5e370
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
X-List-Received-Date: Fri, 14 Oct 2016 16:40:50 -0000

--001a114c55003b7a9e053ed5e370
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2016 at 5:14 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hi Maxim.
>
> On Fri, Oct 7, 2016 at 4:16 AM, Maxim Sloyko <maxims@google.com> wrote:
> > Ping
>
> I can see your sense of urgency in getting these reviewed. May I
> suggest in the future a few tips for making that happen:
>
> You can make sure you address all of the comments from previous
> reviews. It makes your reviewers feel like you're ignoring them, and
> they're wasting their time, when you're asked to fix something and
> subsequent versions do not have the changes made or a discussion as to
> why you chose not to.
>

This is your reply from Sep 28 to the patch that contained same exact
Device Tree:

---------------- 8 < --------------------- 8 <
------------------------------------
This unrelated to the device tree additions and therefore should be in
a separate patch.

The device tree additions look okay.
--------------- 8 < --------------------- 8 < ------------------------------
--------

This is what I replied on Sep 29:

---------------- 8 < --------------------- 8 <
------------------------------------

> This unrelated to the device tree additions and therefore should be in
> a separate patch.
>

This is related, because the device tree can't be used without this fix.
---------------- 8 < --------------------- 8 <
------------------------------------

However, later same day I sent the same patch without board file
modifications (which is in this thread). Yes, I understand how this might
have created some confusion, but I did not see any replies in either that
thread or this one. So I sent the same patch again, but of course the
device tree on the linux side has changed since the time I originally sent
this, so that's no good anymore -- understandably so, it does not make it
less frustrating.


> Make sure you address the patches to your intended audience. Cedric
> and myself have hacked on our u-boot, and I'm sure you have some peers
> from your project team could help out too. You can put those you want
> to review in the 'to' field when creating the patch.
>
> You can help out by providing review for other patches on the list.
> This helps you understand the best practices and code base, which in
> turn helps you write better patches. It also shows you're here to
> collaborate and assist instead of only caring about your own tasks.
>
> I look forward to working with you as we clean up u-boot and implement
> the features that we require!
>
> Cheers,
>
> Joel
>
> >
> > On Wed, Oct 5, 2016 at 9:16 AM, Maxim Sloyko <maxims@google.com> wrote:
> >>
> >> Ping
> >>
> >> On Thu, Sep 29, 2016 at 11:32 AM, <maxims@google.com> wrote:
> >>>
> >>> From: Maxim Sloyko <maxims@google.com>
> >>>
> >>> Device Tree for ast2500, copied from openbmc/linux (include file), plus
> >>> minimal device tree configuration for ast2500 eval board.
> >>> ---
> >>>  arch/arm/dts/Makefile          |   2 +
> >>>  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
> >>>  arch/arm/dts/aspeed-g5.dtsi    | 541
> >>> +++++++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 571 insertions(+)
> >>>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
> >>>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
> >>>
> >>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> >>> index d1f8e22..09efa0a 100644
> >>> --- a/arch/arm/dts/Makefile
> >>> +++ b/arch/arm/dts/Makefile
> >>> @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
> >>>         k2e-evm.dtb \
> >>>         k2g-evm.dtb
> >>>
> >>> +dtb-$(CONFIG_TARGET_AST_G5) += aspeed-g5-evb.dtb
> >>> +
> >>>  targets += $(dtb-y)
> >>>
> >>>  # Add any required device tree compiler flags here
> >>> diff --git a/arch/arm/dts/aspeed-g5-evb.dts
> >>> b/arch/arm/dts/aspeed-g5-evb.dts
> >>> new file mode 100644
> >>> index 0000000..95dc77a
> >>> --- /dev/null
> >>> +++ b/arch/arm/dts/aspeed-g5-evb.dts
> >>> @@ -0,0 +1,28 @@
> >>> +/dts-v1/;
> >>> +
> >>> +#include "aspeed-g5.dtsi"
> >>> +
> >>> +/ {
> >>> +       memory {
> >>> +               device_type = "memory";
> >>> +               reg = <0x80000000 0x20000000>;
> >>> +       };
> >>> +
> >>> +       aliases {
> >>> +               i2c1 = &i2c0;
> >>> +               i2c4 = &i2c3;
> >>> +               i2c8 = &i2c7;
> >>> +       };
> >>> +};
> >>> +
> >>> +&i2c0 {
> >>> +       status = "okay";
> >>> +};
> >>> +
> >>> +&i2c3 {
> >>> +       status = "okay";
> >>> +};
> >>> +
> >>> +&i2c7 {
> >>> +       status = "okay";
> >>> +};
> >>> diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
> >>> new file mode 100644
> >>> index 0000000..eb81a2e
> >>> --- /dev/null
> >>> +++ b/arch/arm/dts/aspeed-g5.dtsi
> >>> @@ -0,0 +1,541 @@
> >>> +/* The device tree is copied from
> >>> + *
> >>> https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/boot/
> dts/aspeed-g5.dtsi
> >>> + */
> >>> +#include "skeleton.dtsi"
> >>> +
> >>> +/ {
> >>> +       model = "Aspeed BMC";
> >>> +       compatible = "aspeed,ast2500";
> >>> +       #address-cells = <1>;
> >>> +       #size-cells = <1>;
> >>> +       interrupt-parent = <&vic>;
> >>> +
> >>> +       cpus {
> >>> +               #address-cells = <1>;
> >>> +               #size-cells = <0>;
> >>> +
> >>> +               cpu@0 {
> >>> +                       compatible = "arm,arm1176jzf-s";
> >>> +                       device_type = "cpu";
> >>> +                       reg = <0>;
> >>> +               };
> >>> +       };
> >>> +
> >>> +       ahb {
> >>> +               compatible = "simple-bus";
> >>> +               #address-cells = <1>;
> >>> +               #size-cells = <1>;
> >>> +               ranges;
> >>> +
> >>> +               vic: interrupt-controller@1e6c0080 {
> >>> +                       compatible = "aspeed,ast2400-vic";
> >>> +                       interrupt-controller;
> >>> +                       #interrupt-cells = <1>;
> >>> +                       valid-sources = <0xfefff7ff 0x0807ffff>;
> >>> +                       reg = <0x1e6c0080 0x80>;
> >>> +               };
> >>> +
> >>> +               mac0: ethernet@1e660000 {
> >>> +                       compatible = "faraday,ftgmac100";
> >>> +                       reg = <0x1e660000 0x180>;
> >>> +                       interrupts = <2>;
> >>> +                       no-hw-checksum;
> >>> +                       status = "disabled";
> >>> +               };
> >>> +
> >>> +               mac1: ethernet@1e680000 {
> >>> +                       compatible = "faraday,ftgmac100";
> >>> +                       reg = <0x1e680000 0x180>;
> >>> +                       interrupts = <3>;
> >>> +                       no-hw-checksum;
> >>> +                       status = "disabled";
> >>> +               };
> >>> +
> >>> +               apb {
> >>> +                       compatible = "simple-bus";
> >>> +                       #address-cells = <1>;
> >>> +                       #size-cells = <1>;
> >>> +                       ranges;
> >>> +
> >>> +                       clk_clkin: clk_clkin@1e6e2070 {
> >>> +                               #clock-cells = <0>;
> >>> +                               compatible = "aspeed,g5-clkin-clock";
> >>> +                               reg = <0x1e6e2070 0x04>;
> >>> +                       };
> >>> +
> >>> +                       syscon: syscon@1e6e2000 {
> >>> +                               compatible = "aspeed,g5-scu", "syscon",
> >>> "simple-mfd";
> >>> +                               reg = <0x1e6e2000 0x1a8>;
> >>> +
> >>> +                               pinctrl: pinctrl@1e6e2000 {
> >>> +                                       compatible =
> "aspeed,g5-pinctrl";
> >>> +
> >>> +                                       pinctrl_i2c9_default:
> >>> i2c9_default {
> >>> +                                               function = "I2C9";
> >>> +                                               groups = "I2C9";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c10_default:
> >>> i2c10_default {
> >>> +                                               function = "I2C10";
> >>> +                                               groups = "I2C10";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c11_default:
> >>> i2c11_default {
> >>> +                                               function = "I2C11";
> >>> +                                               groups = "I2C11";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c12_default:
> >>> i2c12_default {
> >>> +                                               function = "I2C12";
> >>> +                                               groups = "I2C12";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c13_default:
> >>> i2c13_default {
> >>> +                                               function = "I2C13";
> >>> +                                               groups = "I2C13";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_gpid0_default:
> >>> gpid0_default {
> >>> +                                               function = "GPID0";
> >>> +                                               groups = "GPID0";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_gpid1_default:
> >>> gpid1_default {
> >>> +                                               function = "GPID1";
> >>> +                                               groups = "GPID1";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_sd1_default:
> sd1_default
> >>> {
> >>> +                                               function = "SD1";
> >>> +                                               groups = "SD1";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c5_default:
> >>> i2c5_default {
> >>> +                                               function = "I2C5";
> >>> +                                               groups = "I2C5";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c6_default:
> >>> i2c6_default {
> >>> +                                               function = "I2C6";
> >>> +                                               groups = "I2C6";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c7_default:
> >>> i2c7_default {
> >>> +                                               function = "I2C7";
> >>> +                                               groups = "I2C7";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c8_default:
> >>> i2c8_default {
> >>> +                                               function = "I2C8";
> >>> +                                               groups = "I2C8";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm0_default:
> >>> pwm0_default {
> >>> +                                               function = "PWM0";
> >>> +                                               groups = "PWM0";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm1_default:
> >>> pwm1_default {
> >>> +                                               function = "PWM1";
> >>> +                                               groups = "PWM1";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm2_default:
> >>> pwm2_default {
> >>> +                                               function = "PWM2";
> >>> +                                               groups = "PWM2";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm3_default:
> >>> pwm3_default {
> >>> +                                               function = "PWM3";
> >>> +                                               groups = "PWM3";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm4_default:
> >>> pwm4_default {
> >>> +                                               function = "PWM4";
> >>> +                                               groups = "PWM4";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm5_default:
> >>> pwm5_default {
> >>> +                                               function = "PWM5";
> >>> +                                               groups = "PWM5";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm6_default:
> >>> pwm6_default {
> >>> +                                               function = "PWM6";
> >>> +                                               groups = "PWM6";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_pwm7_default:
> >>> pwm7_default {
> >>> +                                               function = "PWM7";
> >>> +                                               groups = "PWM7";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c3_default:
> >>> i2c3_default {
> >>> +                                               function = "I2C3";
> >>> +                                               groups = "I2C3";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c4_default:
> >>> i2c4_default {
> >>> +                                               function = "I2C4";
> >>> +                                               groups = "I2C4";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_i2c14_default:
> >>> i2c14_default {
> >>> +                                               function = "I2C14";
> >>> +                                               groups = "I2C14";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_rgmii1_default:
> >>> rgmii1_default {
> >>> +                                               function = "RGMII1";
> >>> +                                               groups = "RGMII1";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_rmii1_default:
> >>> rmii1_default {
> >>> +                                               function = "RMII1";
> >>> +                                               groups = "RMII1";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_rgmii2_default:
> >>> rgmii2_default {
> >>> +                                               function = "RGMII2";
> >>> +                                               groups = "RGMII2";
> >>> +                                       };
> >>> +
> >>> +                                       pinctrl_rmii2_default:
> >>> rmii2_default {
> >>> +                                               function = "RMII2";
> >>> +                                               groups = "RMII2";
> >>> +                                       };
> >>> +                               };
> >>> +                       };
> >>> +
> >>> +                       clk_hpll: clk_hpll@1e6e2024 {
> >>> +                               #clock-cells = <0>;
> >>> +                               compatible = "aspeed,g5-hpll-clock";
> >>> +                               reg = <0x1e6e2024 0x4>;
> >>> +                               clocks = <&clk_clkin>;
> >>> +                       };
> >>> +
> >>> +                       clk_ahb: clk_ahb@1e6e2070 {
> >>> +                               #clock-cells = <0>;
> >>> +                               compatible = "aspeed,g5-ahb-clock";
> >>> +                               reg = <0x1e6e2070 0x4>;
> >>> +                               clocks = <&clk_hpll>;
> >>> +                       };
> >>> +
> >>> +                       clk_apb: clk_apb@1e6e2008 {
> >>> +                               #clock-cells = <0>;
> >>> +                               compatible = "aspeed,g5-apb-clock";
> >>> +                               reg = <0x1e6e2008 0x4>;
> >>> +                               clocks = <&clk_hpll>;
> >>> +                       };
> >>> +
> >>> +                       clk_uart: clk_uart@1e6e2008 {
> >>> +                               #clock-cells = <0>;
> >>> +                               compatible = "aspeed,uart-clock";
> >>> +                               reg = <0x1e6e202c 0x4>;
> >>> +                       };
> >>> +
> >>> +                       sram@1e720000 {
> >>> +                               compatible = "mmio-sram";
> >>> +                               reg = <0x1e720000 0x9000>;      // 36K
> >>> +                       };
> >>> +
> >>> +                       gpio: gpio@1e780000 {
> >>> +                               #gpio-cells = <2>;
> >>> +                               gpio-controller;
> >>> +                               compatible = "aspeed,ast2500-gpio";
> >>> +                               reg = <0x1e780000 0x1000>;
> >>> +                               interrupts = <20>;
> >>> +                               gpio-ranges = <&pinctrl 0 0 220>;
> >>> +                       };
> >>> +
> >>> +                       timer: timer@1e782000 {
> >>> +                               compatible = "aspeed,ast2400-timer";
> >>> +                               reg = <0x1e782000 0x90>;
> >>> +                               // The moxart_timer driver registers
> only
> >>> one
> >>> +                               // interrupt and assumes it's for
> timer 1
> >>> +                               //interrupts = <16 17 18 35 36 37 38
> 39>;
> >>> +                               interrupts = <16>;
> >>> +                               clocks = <&clk_apb>;
> >>> +                       };
> >>> +
> >>> +                       ibt: ibt@1e789140 {
> >>> +                               compatible = "aspeed,bt-host";
> >>> +                               reg = <0x1e789140 0x18>;
> >>> +                               interrupts = <8>;
> >>> +                       };
> >>> +
> >>> +                       wdt1: wdt@1e785000 {
> >>> +                               compatible = "aspeed,ast2500-wdt";
> >>> +                               reg = <0x1e785000 0x1c>;
> >>> +                       };
> >>> +
> >>> +                       wdt2: wdt@1e785020 {
> >>> +                               compatible = "aspeed,ast2500-wdt";
> >>> +                               reg = <0x1e785020 0x1c>;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       wdt3: wdt@1e785040 {
> >>> +                               compatible = "aspeed,wdt";
> >>> +                               reg = <0x1e785074 0x1c>;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       uart1: serial@1e783000 {
> >>> +                               compatible = "ns16550a";
> >>> +                               reg = <0x1e783000 0x1000>;
> >>> +                               reg-shift = <2>;
> >>> +                               interrupts = <9>;
> >>> +                               clocks = <&clk_uart>;
> >>> +                               no-loopback-test;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       uart2: serial@1e78d000 {
> >>> +                               compatible = "ns16550a";
> >>> +                               reg = <0x1e78d000 0x1000>;
> >>> +                               reg-shift = <2>;
> >>> +                               interrupts = <32>;
> >>> +                               clocks = <&clk_uart>;
> >>> +                               no-loopback-test;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       uart3: serial@1e78e000 {
> >>> +                               compatible = "ns16550a";
> >>> +                               reg = <0x1e78e000 0x1000>;
> >>> +                               reg-shift = <2>;
> >>> +                               interrupts = <33>;
> >>> +                               clocks = <&clk_uart>;
> >>> +                               no-loopback-test;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       uart4: serial@1e78f000 {
> >>> +                               compatible = "ns16550a";
> >>> +                               reg = <0x1e78f000 0x1000>;
> >>> +                               reg-shift = <2>;
> >>> +                               interrupts = <34>;
> >>> +                               clocks = <&clk_uart>;
> >>> +                               no-loopback-test;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       uart5: serial@1e784000 {
> >>> +                               compatible = "ns16550a";
> >>> +                               reg = <0x1e784000 0x1000>;
> >>> +                               reg-shift = <2>;
> >>> +                               interrupts = <10>;
> >>> +                               clocks = <&clk_uart>;
> >>> +                               current-speed = <38400>;
> >>> +                               no-loopback-test;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       vuart: vuart@1e787000 {
> >>> +                               compatible = "aspeed,vuart";
> >>> +                               reg = <0x1e787000 0x1000>;
> >>> +                               reg-shift = <2>;
> >>> +                               interrupts = <8>;
> >>> +                               clocks = <&clk_uart>;
> >>> +                               no-loopback-test;
> >>> +                               status = "disabled";
> >>> +                       };
> >>> +
> >>> +                       i2c: i2c@1e78a000 {
> >>> +                               #address-cells = <1>;
> >>> +                               #size-cells = <1>;
> >>> +                               #interrupt-cells = <1>;
> >>> +
> >>> +                               compatible =
> >>> "aspeed,ast2400-i2c-controller";
> >>> +                               reg = <0x1e78a000 0x40>;
> >>> +                               ranges = <0 0x1e78a000 0x1000>;
> >>> +                               interrupts = <12>;
> >>> +                               clocks = <&clk_apb>;
> >>> +                               clock-ranges;
> >>> +                               interrupt-controller;
> >>> +
> >>> +                               i2c0: i2c-bus@40 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x40 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <0>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <0>;
> >>> +                                       interrupt-parent = <&i2c>;
> >>> +                               };
> >>> +
> >>> +                               i2c1: i2c-bus@80 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x80 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <1>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <1>;
> >>> +                               };
> >>> +
> >>> +                               i2c2: i2c-bus@c0 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0xC0 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <2>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <2>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c3_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c3: i2c-bus@100 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x100 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <3>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <3>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c4_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c4: i2c-bus@140 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x140 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <4>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <4>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c5_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c5: i2c-bus@180 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x180 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <5>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <5>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c6_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c6: i2c-bus@1c0 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x1C0 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <6>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <6>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c7_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c7: i2c-bus@300 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x300 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <7>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <7>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c8_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c8: i2c-bus@340 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x340 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <8>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <8>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c9_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c9: i2c-bus@380 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x380 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <9>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <9>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c10_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c10: i2c-bus@3c0 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x3c0 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <10>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <10>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c11_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c11: i2c-bus@400 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x400 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <11>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <11>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c12_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c12: i2c-bus@440 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x440 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <12>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <12>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c13_default>;
> >>> +                               };
> >>> +
> >>> +                               i2c13: i2c-bus@480 {
> >>> +                                       #address-cells = <1>;
> >>> +                                       #size-cells = <0>;
> >>> +                                       reg = <0x480 0x40>;
> >>> +                                       compatible =
> >>> "aspeed,ast2400-i2c-bus";
> >>> +                                       bus = <13>;
> >>> +                                       clock-frequency = <100000>;
> >>> +                                       status = "disabled";
> >>> +                                       interrupts = <13>;
> >>> +                                       pinctrl-names = "default";
> >>> +                                       pinctrl-0 =
> >>> <&pinctrl_i2c14_default>;
> >>> +                               };
> >>> +
> >>> +                       };
> >>> +
> >>> +               };
> >>> +       };
> >>> +};
> >>> --
> >>> 2.8.0.rc3.226.g39d4020
> >>>
> >>
> >>
> >>
> >> --
> >> Maxim Sloyko
> >
> >
> >
> >
> > --
> > Maxim Sloyko
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >
>



-- 
*M*axim *S*loyko

--001a114c55003b7a9e053ed5e370
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFRodSwgT2N0IDEzLCAyMDE2IGF0IDU6MTQgUE0sIEpvZWwgU3Rh
bmxleSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpqb2VsQGptcy5pZC5hdSIg
dGFyZ2V0PSJfYmxhbmsiPmpvZWxAam1zLmlkLmF1PC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+SGkgTWF4aW0uPGJyPg0KPHNwYW4gY2xhc3M9Im1fNTM0NDk0NjExNjc0NzM3NjcyMmdt
YWlsLSI+PGJyPg0KT24gRnJpLCBPY3QgNywgMjAxNiBhdCA0OjE2IEFNLCBNYXhpbSBTbG95a28g
Jmx0OzxhIGhyZWY9Im1haWx0bzptYXhpbXNAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1h
eGltc0Bnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0OyBQaW5nPGJyPg0KPGJyPg0K
PC9zcGFuPkkgY2FuIHNlZSB5b3VyIHNlbnNlIG9mIHVyZ2VuY3kgaW4gZ2V0dGluZyB0aGVzZSBy
ZXZpZXdlZC4gTWF5IEk8YnI+DQpzdWdnZXN0IGluIHRoZSBmdXR1cmUgYSBmZXcgdGlwcyBmb3Ig
bWFraW5nIHRoYXQgaGFwcGVuOjxicj4NCjxicj4NCllvdSBjYW4gbWFrZSBzdXJlIHlvdSBhZGRy
ZXNzIGFsbCBvZiB0aGUgY29tbWVudHMgZnJvbSBwcmV2aW91czxicj4NCnJldmlld3MuIEl0IG1h
a2VzIHlvdXIgcmV2aWV3ZXJzIGZlZWwgbGlrZSB5b3UmIzM5O3JlIGlnbm9yaW5nIHRoZW0sIGFu
ZDxicj4NCnRoZXkmIzM5O3JlIHdhc3RpbmcgdGhlaXIgdGltZSwgd2hlbiB5b3UmIzM5O3JlIGFz
a2VkIHRvIGZpeCBzb21ldGhpbmcgYW5kPGJyPg0Kc3Vic2VxdWVudCB2ZXJzaW9ucyBkbyBub3Qg
aGF2ZSB0aGUgY2hhbmdlcyBtYWRlIG9yIGEgZGlzY3Vzc2lvbiBhcyB0bzxicj4NCndoeSB5b3Ug
Y2hvc2Ugbm90IHRvLjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGlz
IHlvdXIgcmVwbHkgZnJvbSBTZXAgMjggdG8gdGhlIHBhdGNoIHRoYXQgY29udGFpbmVkIHNhbWUg
ZXhhY3QgRGV2aWNlIFRyZWU6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4tLS0tLS0tLS0tLS0t
LS0tIDggJmx0OyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gOCAmbHQ7IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLTx3YnI+LS0tLS0tPC9kaXY+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44
cHgiPlRoaXMgdW5yZWxhdGVkIHRvIHRoZSBkZXZpY2UgdHJlZSBhZGRpdGlvbnMgYW5kIHRoZXJl
Zm9yZSBzaG91bGQgYmUgaW48L3NwYW4+PGJyIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+YSBzZXBhcmF0ZSBwYXRjaC48L3NwYW4+PGJyIHN0
eWxlPSJmb250LXNpemU6MTIuOHB4Ij48YnIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij5UaGUgZGV2aWNlIHRyZWUgYWRkaXRpb25zIGxvb2sg
b2theS48L3NwYW4+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPi0tLS0tLS0tLS0tLS0t
LSA4ICZsdDsgLS0tLS0tLS0tLS0tLS0tLS0tLS0tIDggJmx0OyAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS08d2JyPi0tLS0tLS0tPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxi
cj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+VGhpcyBpcyB3aGF0IEkgcmVwbGllZCBv
biBTZXAgMjk6PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxicj48L2Rpdj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+LS0tLS0tLS0tLS0tLS0tLSA4ICZsdDsgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tIDggJmx0OyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08d2JyPi0tLS0tLTwv
ZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48c3BhbiBjbGFzcz0ibV81MzQ0OTQ2MTE2NzQ3
Mzc2NzIyZ21haWwtaW0iIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+VGhpcyB1bnJl
bGF0ZWQgdG8gdGhlIGRldmljZSB0cmVlIGFkZGl0aW9ucyBhbmQgdGhlcmVmb3JlIHNob3VsZCBi
ZSBpbjxicj5hIHNlcGFyYXRlIHBhdGNoLjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+
PC9zcGFuPjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPlRoaXMgaXMgcmVsYXRlZCwgYmVj
YXVzZSB0aGUgZGV2aWNlIHRyZWUgY2FuJiMzOTt0IGJlIHVzZWQgd2l0aG91dCB0aGlzIGZpeC48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OnNtYWxsIj4tLS0tLS0tLS0tLS0tLS0tIDggJmx0OyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gOCAm
bHQ7IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTx3YnI+LS0tLS0tPC9zcGFuPjxicj48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48ZGl2IGNsYXNzPSJtXzUzNDQ5NDYx
MTY3NDczNzY3MjJnbWFpbC1hZG0iPjxkaXYgaWQ9Im1fNTM0NDk0NjExNjc0NzM3NjcyMmdtYWls
LXFfMTU3NzNhNTc0NWVhNjE0ZV8yIiBjbGFzcz0ibV81MzQ0OTQ2MTE2NzQ3Mzc2NzIyZ21haWwt
YWpSIG1fNTM0NDk0NjExNjc0NzM3NjcyMmdtYWlsLWg0Ij48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2Pkhvd2V2ZXIsIGxhdGVyIHNhbWUgZGF5IEkgc2VudCB0aGUgc2FtZSBw
YXRjaCB3aXRob3V0IGJvYXJkIGZpbGUgbW9kaWZpY2F0aW9ucyAod2hpY2ggaXMgaW4gdGhpcyB0
aHJlYWQpLiBZZXMsIEkgdW5kZXJzdGFuZCBob3cgdGhpcyBtaWdodCBoYXZlIGNyZWF0ZWQgc29t
ZSBjb25mdXNpb24sIGJ1dCBJIGRpZCBub3Qgc2VlIGFueSByZXBsaWVzIGluIGVpdGhlciB0aGF0
IHRocmVhZCBvciB0aGlzIG9uZS4gU28gSSBzZW50IHRoZSBzYW1lIHBhdGNoIGFnYWluLCBidXQg
b2YgY291cnNlIHRoZSBkZXZpY2UgdHJlZSBvbiB0aGUgbGludXggc2lkZSBoYXMgY2hhbmdlZCBz
aW5jZSB0aGUgdGltZSBJIG9yaWdpbmFsbHkgc2VudCB0aGlzLCBzbyB0aGF0JiMzOTtzIG5vIGdv
b2QgYW55bW9yZSAtLSB1bmRlcnN0YW5kYWJseSBzbywgaXQgZG9lcyBub3QgbWFrZSBpdCBsZXNz
IGZydXN0cmF0aW5nLsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJyPg0KTWFrZSBz
dXJlIHlvdSBhZGRyZXNzIHRoZSBwYXRjaGVzIHRvIHlvdXIgaW50ZW5kZWQgYXVkaWVuY2UuIENl
ZHJpYzxicj4NCmFuZCBteXNlbGYgaGF2ZSBoYWNrZWQgb24gb3VyIHUtYm9vdCwgYW5kIEkmIzM5
O20gc3VyZSB5b3UgaGF2ZSBzb21lIHBlZXJzPGJyPg0KZnJvbSB5b3VyIHByb2plY3QgdGVhbSBj
b3VsZCBoZWxwIG91dCB0b28uIFlvdSBjYW4gcHV0IHRob3NlIHlvdSB3YW50PGJyPg0KdG8gcmV2
aWV3IGluIHRoZSAmIzM5O3RvJiMzOTsgZmllbGQgd2hlbiBjcmVhdGluZyB0aGUgcGF0Y2guPGJy
Pg0KPGJyPg0KWW91IGNhbiBoZWxwIG91dCBieSBwcm92aWRpbmcgcmV2aWV3IGZvciBvdGhlciBw
YXRjaGVzIG9uIHRoZSBsaXN0Ljxicj4NClRoaXMgaGVscHMgeW91IHVuZGVyc3RhbmQgdGhlIGJl
c3QgcHJhY3RpY2VzIGFuZCBjb2RlIGJhc2UsIHdoaWNoIGluPGJyPg0KdHVybiBoZWxwcyB5b3Ug
d3JpdGUgYmV0dGVyIHBhdGNoZXMuIEl0IGFsc28gc2hvd3MgeW91JiMzOTtyZSBoZXJlIHRvPGJy
Pg0KY29sbGFib3JhdGUgYW5kIGFzc2lzdCBpbnN0ZWFkIG9mIG9ubHkgY2FyaW5nIGFib3V0IHlv
dXIgb3duIHRhc2tzLjxicj4NCjxicj4NCkkgbG9vayBmb3J3YXJkIHRvIHdvcmtpbmcgd2l0aCB5
b3UgYXMgd2UgY2xlYW4gdXAgdS1ib290IGFuZCBpbXBsZW1lbnQ8YnI+DQp0aGUgZmVhdHVyZXMg
dGhhdCB3ZSByZXF1aXJlITxicj4NCjxicj4NCkNoZWVycyw8YnI+DQo8YnI+DQpKb2VsPGJyPg0K
PGRpdj48ZGl2IGNsYXNzPSJtXzUzNDQ5NDYxMTY3NDczNzY3MjJnbWFpbC1oNSI+PGJyPg0KJmd0
Ozxicj4NCiZndDsgT24gV2VkLCBPY3QgNSwgMjAxNiBhdCA5OjE2IEFNLCBNYXhpbSBTbG95a28g
Jmx0OzxhIGhyZWY9Im1haWx0bzptYXhpbXNAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1h
eGltc0Bnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0
OyBQaW5nPGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBPbiBUaHUsIFNlcCAyOSwgMjAxNiBh
dCAxMTozMiBBTSwgJmx0OzxhIGhyZWY9Im1haWx0bzptYXhpbXNAZ29vZ2xlLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPm1heGltc0Bnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0OyZndDsm
Z3Q7PGJyPg0KJmd0OyZndDsmZ3Q7IEZyb206IE1heGltIFNsb3lrbyAmbHQ7PGEgaHJlZj0ibWFp
bHRvOm1heGltc0Bnb29nbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWF4aW1zQGdvb2dsZS5jb208
L2E+Jmd0Ozxicj4NCiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7Jmd0OyBEZXZpY2UgVHJlZSBm
b3IgYXN0MjUwMCwgY29waWVkIGZyb20gb3BlbmJtYy9saW51eCAoaW5jbHVkZSBmaWxlKSwgcGx1
czxicj4NCiZndDsmZ3Q7Jmd0OyBtaW5pbWFsIGRldmljZSB0cmVlIGNvbmZpZ3VyYXRpb24gZm9y
IGFzdDI1MDAgZXZhbCBib2FyZC48YnI+DQomZ3Q7Jmd0OyZndDsgLS0tPGJyPg0KJmd0OyZndDsm
Z3Q7wqAgYXJjaC9hcm0vZHRzL01ha2VmaWxlwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArPGJyPg0K
Jmd0OyZndDsmZ3Q7wqAgYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuZHRzIHzCoCAyOCArKys8
YnI+DQomZ3Q7Jmd0OyZndDvCoCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LmR0c2nCoCDCoCB8IDU0
MTxicj4NCiZndDsmZ3Q7Jmd0OyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8d2JyPisr
KysrKysrKysrPGJyPg0KJmd0OyZndDsmZ3Q7wqAgMyBmaWxlcyBjaGFuZ2VkLCA1NzEgaW5zZXJ0
aW9ucygrKTxicj4NCiZndDsmZ3Q7Jmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9k
dHMvYXNwZWVkLWc1LWV2Yi5kdHM8YnI+DQomZ3Q7Jmd0OyZndDvCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpPGJyPg0KJmd0OyZndDsmZ3Q7PGJyPg0KJmd0
OyZndDsmZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9k
dHMvTWFrZWZpbGU8YnI+DQomZ3Q7Jmd0OyZndDsgaW5kZXggZDFmOGUyMi4uMDllZmEwYSAxMDA2
NDQ8YnI+DQomZ3Q7Jmd0OyZndDsgLS0tIGEvYXJjaC9hcm0vZHRzL01ha2VmaWxlPGJyPg0KJmd0
OyZndDsmZ3Q7ICsrKyBiL2FyY2gvYXJtL2R0cy9NYWtlZmlsZTxicj4NCiZndDsmZ3Q7Jmd0OyBA
QCAtMjMzLDYgKzIzMyw4IEBAIGR0Yi0kKENPTkZJR19TT0NfS0VZU1RPTkUpICs9IGsyaGstZXZt
LmR0YiBcPGJyPg0KJmd0OyZndDsmZ3Q7wqAgwqAgwqAgwqAgwqBrMmUtZXZtLmR0YiBcPGJyPg0K
Jmd0OyZndDsmZ3Q7wqAgwqAgwqAgwqAgwqBrMmctZXZtLmR0Yjxicj4NCiZndDsmZ3Q7Jmd0Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArZHRiLSQoQ09ORklHX1RBUkdFVF9BU1RfRzUpICs9IGFzcGVlZC1n
NS1ldmIuZHRiPGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDvCoCB0YXJnZXRz
ICs9ICQoZHRiLXkpPGJyPg0KJmd0OyZndDsmZ3Q7PGJyPg0KJmd0OyZndDsmZ3Q7wqAgIyBBZGQg
YW55IHJlcXVpcmVkIGRldmljZSB0cmVlIGNvbXBpbGVyIGZsYWdzIGhlcmU8YnI+DQomZ3Q7Jmd0
OyZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUtZXZiLmQ8d2JyPnRzPGJy
Pg0KJmd0OyZndDsmZ3Q7IGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuZDx3YnI+dHM8YnI+
DQomZ3Q7Jmd0OyZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7Jmd0OyZndDsgaW5k
ZXggMDAwMDAwMC4uOTVkYzc3YTxicj4NCiZndDsmZ3Q7Jmd0OyAtLS0gL2Rldi9udWxsPGJyPg0K
Jmd0OyZndDsmZ3Q7ICsrKyBiL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUtZXZiLmQ8d2JyPnRzPGJy
Pg0KJmd0OyZndDsmZ3Q7IEBAIC0wLDAgKzEsMjggQEA8YnI+DQomZ3Q7Jmd0OyZndDsgKy9kdHMt
djEvOzxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsjaW5jbHVkZSAmcXVv
dDthc3BlZWQtZzUuZHRzaSZxdW90Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsm
Z3Q7ICsvIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgbWVtb3J5IHs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2aWNlX3R5cGUgPSAmcXVvdDttZW1v
cnkmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDgwMDAwMDAwIDB4MjAwMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oGFsaWFzZXMgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMx
ID0gJmFtcDtpMmMwOzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
MmM0ID0gJmFtcDtpMmMzOzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpMmM4ID0gJmFtcDtpMmM3Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyAr
JmFtcDtpMmMwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7
b2theSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK307PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyZhbXA7aTJjMyB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICt9Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsmYW1wO2kyYzcgezxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArfTs8YnI+DQomZ3Q7Jmd0OyZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9hc3Bl
ZWQtZzUuZHRzaSBiL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUuZHRzaTxicj4NCiZndDsmZ3Q7Jmd0
OyBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCiZndDsmZ3Q7Jmd0OyBpbmRleCAwMDAwMDAwLi5l
YjgxYTJlPGJyPg0KJmd0OyZndDsmZ3Q7IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7Jmd0OyZndDsg
KysrIGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpPGJyPg0KJmd0OyZndDsmZ3Q7IEBAIC0w
LDAgKzEsNTQxIEBAPGJyPg0KJmd0OyZndDsmZ3Q7ICsvKiBUaGUgZGV2aWNlIHRyZWUgaXMgY29w
aWVkIGZyb208YnI+DQomZ3Q7Jmd0OyZndDsgKyAqPGJyPg0KJmd0OyZndDsmZ3Q7IDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvOWVjOWQwOS9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtZzUuZHRzaSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGluPHdicj51eC9ibG9iLzllYzlkMDkvYXJjaC9h
cm0vYm9vdC88d2JyPmR0cy9hc3BlZWQtZzUuZHRzaTwvYT48YnI+DQomZ3Q7Jmd0OyZndDsgKyAq
Lzxicj4NCiZndDsmZ3Q7Jmd0OyArI2luY2x1ZGUgJnF1b3Q7c2tlbGV0b24uZHRzaSZxdW90Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsvIHs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgbW9kZWwgPSAmcXVvdDtBc3BlZWQgQk1DJnF1b3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAmcXVv
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsm
YW1wO3ZpYyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgY3B1cyB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNh
ZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVAMCB7PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDthcm0sYXJtMTE3Nmp6Zi1zJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZpY2VfdHlwZSA9ICZxdW90O2NwdSZxdW90
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoGFoYiB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzaW1wbGUtYnVzJnF1b3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxs
cyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I3NpemUtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJhbmdlczs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2aWM6IGludGVycnVwdC1jb250cm9sbGVyQDFlNmMwMDgw
IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLXZpYyZxdW90Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRy
b2xsZXI7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZhbGlkLXNvdXJjZXMgPSAmbHQ7MHhmZWZm
ZjdmZiAweDA4MDdmZmZmJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2YzAwODAgMHg4MCZndDs7PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFjMDogZXRoZXJuZXRA
MWU2NjAwMDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7ZmFyYWRheSxmdGdtYWMxMDAmcXVvdDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDFlNjYwMDAwIDB4MTgwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8taHctY2hlY2tzdW07
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hYzE6IGV0aGVybmV0QDFlNjgwMDAwIHs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O2ZhcmFkYXksZnRnbWFjMTAwJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTY4MDAwMCAweDE4MCZn
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7MyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWh3LWNoZWNrc3VtOzxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxl
ZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhcGIgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c2ltcGxlLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAm
bHQ7MSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZXM7PGJyPg0KJmd0OyZndDsmZ3Q7ICs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xr
X2Nsa2luOiBjbGtfY2xraW5AMWU2ZTIwNzAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7
MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtY2xraW4tY2xvY2sm
cXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDcwIDB4MDQmZ3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN5c2Nvbjogc3lzY29uQDFlNmUyMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O2FzcGVlZCxnNS1zY3UmcXVvdDssICZxdW90O3N5c2NvbiZxdW90Oyw8YnI+DQomZ3Q7Jmd0
OyZndDsgJnF1b3Q7c2ltcGxlLW1mZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIw
MDAgMHgxYTgmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmw6IHBpbmN0
cmxAMWU2ZTIwMDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNw
ZWVkLGc1LXBpbmN0cmwmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGluY3RybF9pMmM5X2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IGkyYzlfZGVmYXVs
dCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJD
OSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7
STJDOSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzEwX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsm
Z3Q7IGkyYzEwX2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5j
dGlvbiA9ICZxdW90O0kyQzEwJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncm91cHMgPSAmcXVvdDtJMkMxMCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzExX2RlZmF1
bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IGkyYzExX2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzExJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMxMSZxdW90Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBw
aW5jdHJsX2kyYzEyX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IGkyYzEyX2RlZmF1bHQgezxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzEyJnF1
b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMx
MiZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzEzX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7
IGkyYzEzX2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlv
biA9ICZxdW90O0kyQzEzJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cm91cHMgPSAmcXVvdDtJMkMxMyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQom
Z3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2dwaWQwX2RlZmF1bHQ6
PGJyPg0KJmd0OyZndDsmZ3Q7IGdwaWQwX2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0dQSUQwJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtHUElEMCZxdW90Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsX2dwaWQxX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IGdwaWQxX2RlZmF1bHQgezxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0dQSUQxJnF1b3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtHUElEMSZx
dW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBwaW5jdHJsX3NkMV9kZWZhdWx0OiBzZDFfZGVmYXVsdDxicj4NCiZndDsm
Z3Q7Jmd0OyB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1
b3Q7U0QxJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAm
cXVvdDtTRDEmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7
ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmM1X2RlZmF1bHQ6PGJyPg0KJmd0OyZn
dDsmZ3Q7IGkyYzVfZGVmYXVsdCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1
bmN0aW9uID0gJnF1b3Q7STJDNSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ3JvdXBzID0gJnF1b3Q7STJDNSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzZfZGVmYXVs
dDo8YnI+DQomZ3Q7Jmd0OyZndDsgaTJjNl9kZWZhdWx0IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkM2JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM2JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0
cmxfaTJjN19kZWZhdWx0Ojxicj4NCiZndDsmZ3Q7Jmd0OyBpMmM3X2RlZmF1bHQgezxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzcmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzcmcXVvdDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybF9pMmM4X2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IGkyYzhfZGVm
YXVsdCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7
STJDOCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1
b3Q7STJDOCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsg
Kzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3B3bTBfZGVmYXVsdDo8YnI+DQomZ3Q7Jmd0
OyZndDsgcHdtMF9kZWZhdWx0IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVu
Y3Rpb24gPSAmcXVvdDtQV00wJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncm91cHMgPSAmcXVvdDtQV00wJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtMV9kZWZhdWx0
Ojxicj4NCiZndDsmZ3Q7Jmd0OyBwd20xX2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1BXTTEmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTEmcXVvdDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bF9wd20yX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IHB3bTJfZGVmYXVsdCB7PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNMiZxdW90Ozs8YnI+
DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7UFdNMiZxdW90Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBwaW5jdHJsX3B3bTNfZGVmYXVsdDo8YnI+DQomZ3Q7Jmd0OyZndDsgcHdtM19kZWZh
dWx0IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQ
V00zJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVv
dDtQV00zJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtNF9kZWZhdWx0Ojxicj4NCiZndDsmZ3Q7
Jmd0OyBwd200X2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5j
dGlvbiA9ICZxdW90O1BXTTQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdyb3VwcyA9ICZxdW90O1BXTTQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd201X2RlZmF1bHQ6
PGJyPg0KJmd0OyZndDsmZ3Q7IHB3bTVfZGVmYXVsdCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7UFdNNSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
X3B3bTZfZGVmYXVsdDo8YnI+DQomZ3Q7Jmd0OyZndDsgcHdtNl9kZWZhdWx0IHs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV002JnF1b3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV002JnF1b3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmxfcHdtN19kZWZhdWx0Ojxicj4NCiZndDsmZ3Q7Jmd0OyBwd203X2RlZmF1
bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1BX
TTcmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90
O1BXTTcmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmMzX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsm
Z3Q7IGkyYzNfZGVmYXVsdCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0
aW9uID0gJnF1b3Q7STJDMyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z3JvdXBzID0gJnF1b3Q7STJDMyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQom
Z3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzRfZGVmYXVsdDo8
YnI+DQomZ3Q7Jmd0OyZndDsgaTJjNF9kZWZhdWx0IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkM0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxf
aTJjMTRfZGVmYXVsdDo8YnI+DQomZ3Q7Jmd0OyZndDsgaTJjMTRfZGVmYXVsdCB7PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMTQmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzE0JnF1b3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBpbmN0cmxfcmdtaWkxX2RlZmF1bHQ6PGJyPg0KJmd0OyZndDsmZ3Q7IHJnbWlp
MV9kZWZhdWx0IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAm
cXVvdDtSR01JSTEmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3Vw
cyA9ICZxdW90O1JHTUlJMSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3JtaWkxX2RlZmF1bHQ6PGJy
Pg0KJmd0OyZndDsmZ3Q7IHJtaWkxX2RlZmF1bHQgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1JNSUkxJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtSTUlJMSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
X3JnbWlpMl9kZWZhdWx0Ojxicj4NCiZndDsmZ3Q7Jmd0OyByZ21paTJfZGVmYXVsdCB7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UkdNSUkyJnF1b3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtSR01JSTIm
cXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybF9ybWlpMl9kZWZhdWx0Ojxicj4NCiZndDsmZ3Q7Jmd0OyBy
bWlpMl9kZWZhdWx0IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24g
PSAmcXVvdDtSTUlJMiZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Jv
dXBzID0gJnF1b3Q7Uk1JSTImcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX2hwbGw6IGNsa19ocGxsQDFlNmUyMDI0IHs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
YXNwZWVkLGc1LWhwbGwtY2xvY2smcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDI0
IDB4NCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19jbGtpbiZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2xrX2FoYjogY2xrX2FoYkAxZTZlMjA3MCB7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1j
ZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxnNS1h
aGItY2xvY2smcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDcwIDB4NCZndDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19ocGxsJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsg
Kzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
bGtfYXBiOiBjbGtfYXBiQDFlNmUyMDA4IHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGc1LWFwYi1jbG9jayZxdW90
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIwMDggMHg0Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tz
ID0gJmx0OyZhbXA7Y2xrX2hwbGwmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa191YXJ0OiBjbGtf
dWFydEAxZTZlMjAwOCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCx1YXJ0LWNsb2NrJnF1b3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MHgxZTZlMjAyYyAweDQmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNyYW1AMWU3MjAw
MDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bW1pby1zcmFtJnF1b3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgxZTcyMDAwMCAweDkwMDAmZ3Q7O8KgIMKgIMKgIC8vIDM2Szxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGdwaW86IGdwaW9AMWU3ODAwMDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZs
dDsyJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
JnF1b3Q7YXNwZWVkLGFzdDI1MDAtZ3BpbyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3
ODAwMDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyMCZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cGluY3RybCAwIDAgMjIwJmd0Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB0aW1lcjogdGltZXJAMWU3ODIwMDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7YXNwZWVkLGFzdDI0MDAtdGltZXImcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzgy
MDAwIDB4OTAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvLyBUaGUgbW94YXJ0X3RpbWVyIGRyaXZlciByZWdpc3Rl
cnMgb25seTxicj4NCiZndDsmZ3Q7Jmd0OyBvbmU8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy8gaW50ZXJydXB0IGFuZCBh
c3N1bWVzIGl0JiMzOTtzIGZvciB0aW1lciAxPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8vaW50ZXJydXB0cyA9ICZsdDsx
NiAxNyAxOCAzNSAzNiAzNyAzOCAzOSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTYm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfYXBiJmd0Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0
OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpYnQ6IGlidEAxZTc4OTE0MCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3Bl
ZWQsYnQtaG9zdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODkxNDAgMHgxOCZndDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+
DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd2R0MTog
d2R0QDFlNzg1MDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAw
LXdkdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODUwMDAgMHgxYyZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgd2R0Mjogd2R0QDFlNzg1MDIwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O2FzcGVlZCxhc3QyNTAwLXdkdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODUw
MjAgMHgxYyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHdkdDM6IHdkdEAxZTc4NTA0MCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthc3BlZWQsd2R0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NTA3NCAweDFj
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZn
dDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdWFydDE6IHNlcmlhbEAxZTc4MzAwMCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDtuczE2NTUwYSZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODMwMDAgMHgxMDAwJmd0
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnLXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0g
Jmx0OzkmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1
b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQyOiBzZXJpYWxAMWU3OGQwMDAgezxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFl
NzhkMDAwIDB4MTAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW50ZXJydXB0cyA9ICZsdDszMiZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Ns
a191YXJ0Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0g
JnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDM6IHNlcmlhbEAxZTc4
ZTAwMCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnID0gJmx0OzB4MWU3OGUwMDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnLXNoaWZ0ID0g
Jmx0OzImZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMzJmd0Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2tzID0gJmx0OyZhbXA7Y2xrX3VhcnQmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsg
Kzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1
YXJ0NDogc2VyaWFsQDFlNzhmMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O25zMTY1
NTBhJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4ZjAwMCAweDEwMDAmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MzQm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5v
LWxvb3BiYWNrLXRlc3Q7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHVhcnQ1OiBzZXJpYWxAMWU3ODQwMDAgezxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg0MDAw
IDB4MTAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0cyA9ICZsdDsxMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191YXJ0
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY3VycmVudC1zcGVlZCA9ICZsdDszODQwMCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5v
LWxvb3BiYWNrLXRlc3Q7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHZ1YXJ0OiB2dWFydEAxZTc4NzAwMCB7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDthc3BlZWQsdnVhcnQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg3
MDAwIDB4MTAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDs4Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX3Vh
cnQmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmM6IGkyY0AxZTc4YTAwMCB7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9
ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1
b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWNvbnRyb2xsZXI8d2JyPiZxdW90Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4MWU3OGEwMDAgMHg0MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJhbmdlcyA9ICZsdDswIDB4MWU3
OGEwMDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19hcGImZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1yYW5nZXM7
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGkyYzA6IGkyYy1idXNANDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxs
cyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZn
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQwIDB4NDAmZ3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVk
LGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzAm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdC1wYXJlbnQgPSAmbHQ7JmFtcDtpMmMmZ3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzE6IGkyYy1idXNAODAgezxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDgwIDB4NDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID08YnI+DQom
Z3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnVzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1m
cmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0g
JnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7MSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMjog
aTJjLWJ1c0BjMCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4QzAgMHg0MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPTxicj4NCiZndDsmZ3Q7Jmd0OyAmcXVvdDthc3BlZWQsYXN0MjQwMC1p
MmMtYnVzJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MiZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlu
Y3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBp
bmN0cmwtMCA9PGJyPg0KJmd0OyZndDsmZ3Q7ICZsdDsmYW1wO3BpbmN0cmxfaTJjM19kZWZhdWx0
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMzOiBpMmMt
YnVzQDEwMCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MTAwIDB4NDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJj
LWJ1cyZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzMmZ3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0
cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsLTAgPTxicj4NCiZndDsmZ3Q7Jmd0OyAmbHQ7JmFtcDtwaW5jdHJsX2kyYzRfZGVmYXVsdCZn
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjNDogaTJjLWJ1
c0AxNDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDE0MCAweDQwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9PGJyPg0KJmd0OyZndDsmZ3Q7ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1i
dXMmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDs0Jmd0Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpbnRlcnJ1cHRzID0gJmx0OzQmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
LW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bC0wID08YnI+DQomZ3Q7Jmd0OyZndDsgJmx0OyZhbXA7cGluY3RybF9pMmM1X2RlZmF1bHQmZ3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzU6IGkyYy1idXNA
MTgwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWcgPSAmbHQ7MHgxODAgMHg0MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPTxicj4NCiZndDsmZ3Q7Jmd0OyAmcXVvdDthc3BlZWQsYXN0MjQwMC1pMmMtYnVz
JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7NSZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW50ZXJydXB0cyA9ICZsdDs1Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1u
YW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwt
MCA9PGJyPg0KJmd0OyZndDsmZ3Q7ICZsdDsmYW1wO3BpbmN0cmxfaTJjNl9kZWZhdWx0Jmd0Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmM2OiBpMmMtYnVzQDFj
MCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzB4MUMwIDB4NDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZx
dW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzYmZ3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7NiZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFt
ZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAg
PTxicj4NCiZndDsmZ3Q7Jmd0OyAmbHQ7JmFtcDtwaW5jdHJsX2kyYzdfZGVmYXVsdCZndDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjNzogaTJjLWJ1c0AzMDAg
ezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDsweDMwMCAweDQwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9PGJyPg0KJmd0OyZndDsmZ3Q7ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVv
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDs3Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
bnRlcnJ1cHRzID0gJmx0OzcmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVz
ID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID08
YnI+DQomZ3Q7Jmd0OyZndDsgJmx0OyZhbXA7cGluY3RybF9pMmM4X2RlZmF1bHQmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzg6IGkyYy1idXNAMzQwIHs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgzNDAgMHg0MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPTxicj4NCiZndDsmZ3Q7Jmd0OyAmcXVvdDthc3BlZWQsYXN0MjQwMC1pMmMtYnVzJnF1b3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7OCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0cyA9ICZsdDs4Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9
ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9PGJy
Pg0KJmd0OyZndDsmZ3Q7ICZsdDsmYW1wO3BpbmN0cmxfaTJjOV9kZWZhdWx0Jmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmM5OiBpMmMtYnVzQDM4MCB7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4MzgwIDB4NDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzkmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7OSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAm
cXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPTxicj4N
CiZndDsmZ3Q7Jmd0OyAmbHQ7JmFtcDtwaW5jdHJsX2kyYzEwX2RlZmF1bHQmZ3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEwOiBpMmMtYnVzQDNjMCB7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4M2MwIDB4NDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzEwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRl
cnJ1cHRzID0gJmx0OzEwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9
ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9PGJy
Pg0KJmd0OyZndDsmZ3Q7ICZsdDsmYW1wO3BpbmN0cmxfaTJjMTFfZGVmYXVsdCZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTE6IGkyYy1idXNANDAwIHs8
YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0
OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHg0MDAgMHg0MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPTxicj4NCiZndDsmZ3Q7Jmd0OyAmcXVvdDthc3BlZWQsYXN0MjQwMC1pMmMtYnVzJnF1b3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dGVycnVwdHMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVz
ID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID08
YnI+DQomZ3Q7Jmd0OyZndDsgJmx0OyZhbXA7cGluY3RybF9pMmMxMl9kZWZhdWx0Jmd0Ozs8YnI+
DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxMjogaTJjLWJ1c0A0NDAg
ezxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDsweDQ0MCAweDQwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9PGJyPg0KJmd0OyZndDsmZ3Q7ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVv
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsxMiZndDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFt
ZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAg
PTxicj4NCiZndDsmZ3Q7Jmd0OyAmbHQ7JmFtcDtwaW5jdHJsX2kyYzEzX2RlZmF1bHQmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEzOiBpMmMtYnVzQDQ4
MCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzB4NDgwIDB4NDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID08YnI+DQomZ3Q7Jmd0OyZndDsgJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZx
dW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzEzJmd0Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpbnRlcnJ1cHRzID0gJmx0OzEzJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1u
YW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwt
MCA9PGJyPg0KJmd0OyZndDsmZ3Q7ICZsdDsmYW1wO3BpbmN0cmxfaTJjMTRfZGVmYXVsdCZndDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4N
CiZndDsmZ3Q7Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArfTs8YnI+DQomZ3Q7Jmd0OyZndDsg
LS08YnI+DQomZ3Q7Jmd0OyZndDsgMi44LjAucmMzLjIyNi5nMzlkNDAyMDxicj4NCiZndDsmZ3Q7
Jmd0Ozxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsm
Z3Q7IC0tPGJyPg0KJmd0OyZndDsgTWF4aW0gU2xveWtvPGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+
DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgLS08YnI+DQomZ3Q7IE1heGltIFNsb3lrbzxicj4N
CiZndDs8YnI+DQo8L2Rpdj48L2Rpdj4mZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xzx3YnI+X19fX19fX19fX19fX19fX188YnI+DQomZ3Q7IG9wZW5ibWMgbWFpbGluZyBsaXN0PGJy
Pg0KJmd0OyA8YSBocmVmPSJtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiB0YXJnZXQ9
Il9ibGFuayI+b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPC9hPjxicj4NCiZndDsgPGEgaHJlZj0i
aHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL29wZW5ibWMiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aTx3YnI+bmZv
L29wZW5ibWM8L2E+PGJyPg0KJmd0Ozxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PGJyIGNs
ZWFyPSJhbGwiPjxkaXY+PGJyPjwvZGl2Pi0tIDxicj48ZGl2IGNsYXNzPSJtXzUzNDQ5NDYxMTY3
NDczNzY3MjJnbWFpbF9zaWduYXR1cmUiPjxkaXY+PGI+TTwvYj5heGltIDxiPlM8L2I+bG95a288
L2Rpdj48L2Rpdj4NCjwvZGl2PjwvZGl2Pg0K
--001a114c55003b7a9e053ed5e370--
