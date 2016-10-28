Return-Path: <raltherr@google.com>
Received: from mail-yw0-x22b.google.com (mail-yw0-x22b.google.com
 [IPv6:2607:f8b0:4002:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4m6v2MQTzDvQ7
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 12:16:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ENdx718A; 
 dkim-atps=neutral
Received: by mail-yw0-x22b.google.com with SMTP id p22so51747647ywe.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 18:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rwGGDTwIBXAJf5Egxf9LKRliSCQ2vgdEU1GlONCWeoM=;
 b=ENdx718AEXXj0q6wxvSZAtwiPh3IccMvIt+Y9NWQMAT+6j9WpLPmetci7fqAHllmzq
 kG74CwETzErrprmoxvmIdi5GaE5ByUe3JhTvY/tijnj1GcAHC/Mho13AltWlttsi5g8Z
 zwN6Ewiy1+4tq9enZaXMQ+aYH19+JKM0z+PmvGVBXfzbInHSInKqMy6kSfy2EvOIlGHw
 4aU5/M/an5QPrpp/mPgTsCDwwoxtm4fFFj3G22pQV6cAaLRZMjFTsl/8zbd2a3b7pcNh
 e+zXDAQvsQu5i6yEgYilKJMLmcp6wltdRcYHl3l9FVkQtNaSdhJeysUV8C39+QFuF7At
 yMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rwGGDTwIBXAJf5Egxf9LKRliSCQ2vgdEU1GlONCWeoM=;
 b=gsT3XF1Mn+cLAlft4VRsqrRGQTQhgV90TVgO086e1O77Bzaa2sntyvzXEWJcyRNodw
 Tx4eVyDsIwIgL6+tgi3YuG7yDBefYSyiJ58L9BgrO75Y5ACza0QPBhZ9fO4K0TeI9D6p
 q66Fk/tDLMZAeQV7tSchV0/h8bVqFQrBrBLLMfhFQ8cNUtltGs2uP8eJPKl+CvvYKShF
 nkSfk9w/p1YYnXp+vOhV8WXkFmXGr+bg2VE4dhY/IN69QVo1CMxXvflgl8HCU1T4Rflp
 umvUWYAfIZUMZf1riHpB9V+CQb96iw/23/Iura1PXzpyajlBStvnh5HdXGbbsnRpCiz2
 MXyQ==
X-Gm-Message-State: ABUngvdmmQqjc1eKFagfSZC4UJg5T6eW7Sw3H0cF3morRwaroNlL+P0brEiijRiqDePvhrgkphfQeD8BR5Rid4SX
X-Received: by 10.129.146.142 with SMTP id j136mr9654892ywg.275.1477617379321; 
 Thu, 27 Oct 2016 18:16:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Thu, 27 Oct 2016 18:16:18 -0700 (PDT)
In-Reply-To: <1477611622-28120-4-git-send-email-jaghu@google.com>
References: <1477611622-28120-1-git-send-email-jaghu@google.com>
 <1477611622-28120-4-git-send-email-jaghu@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 27 Oct 2016 18:16:18 -0700
Message-ID: <CAPLgG=kaH56_SxhM3mQMzpc4JA1vASAe8jhL0bg=td6WwSfSTw@mail.gmail.com>
Subject: Re: [PATCH linux v1 3/3] devicetree: Add support in Zaius for PWM
 controller and four PWM outputs(fans)
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c093d7202ad4a053fe29b71
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
X-List-Received-Date: Fri, 28 Oct 2016 01:16:24 -0000

--94eb2c093d7202ad4a053fe29b71
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 27, 2016 at 4:40 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 63
> ++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index eef045b..82a12dc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -83,6 +83,69 @@
>                         gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       pwm_controller {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0x1E786000 0x78>;
> +               compatible = "aspeed-pwm-controller";
> +               clock_enable = /bits/ 8 <0x01>;
> +               clock_source = /bits/ 8 <0x00>;
> +               typem_pwm_clock = <5 0 95>;
> +       };
> +
> +       pwm0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       reg = <0x1E786000 0x78>;
> +                       compatible = "aspeed-pwm-dev";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_pwm0_default>;
> +                       pwm_channel_enable = /bits/ 8 <0x00>;
> +                       pwm_type = /bits/ 8 <0x00>;
> +                       rising = /bits/ 8 <0x00>;
> +                       falling = /bits/ 8 <0x00>;
> +       };
> +
>

As Andrew mentioned in a reply to your cover letter, please explain the
structure of the hardware and the drivers.  I see that you are repeating
the register address range in each pwmX entry.  That should go away if you
make the pwmX entries children of the pwm_controller entry.  I think you
can use address cell in the children to indicate the PWM channel # and let
pwm_controller map that back to the correct physical address.


> +       pwm1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       reg = <0x1E786000 0x78>;
> +                       compatible = "aspeed-pwm-dev";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_pwm1_default>;
> +                       pwm_channel_enable = /bits/ 8 <0x01>;
> +                       pwm_type = /bits/ 8 <0x00>;
> +                       rising = /bits/ 8 <0x00>;
> +                       falling = /bits/ 8 <0x00>;
> +       };
> +
> +       pwm2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       reg = <0x1E786000 0x78>;
> +                       compatible = "aspeed-pwm-dev";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_pwm2_default>;
> +                       pwm_channel_enable = /bits/ 8 <0x02>;
> +                       pwm_type = /bits/ 8 <0x00>;
> +                       rising = /bits/ 8 <0x00>;
> +                       falling = /bits/ 8 <0x00>;
> +       };
> +
> +       pwm3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       reg = <0x1E786000 0x78>;
> +                       compatible = "aspeed-pwm-dev";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_pwm3_default>;
> +                       pwm_channel_enable = /bits/ 8 <0x03>;
> +                       pwm_type = /bits/ 8 <0x00>;
> +                       rising = /bits/ 8 <0x00>;
> +                       falling = /bits/ 8 <0x00>;
> +       };
> +
>  };
>
>  &uart5 {
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c093d7202ad4a053fe29b71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFRodSwgT2N0IDI3LCAyMDE2IGF0IDQ6NDAgUE0sIEphZ2hhdGhp
c3dhcmkgUmFua2FwcGFnb3VuZGVyIE5hdGFyYWphbiA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhy
ZWY9Im1haWx0bzpqYWdodUBnb29nbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFnaHVAZ29vZ2xl
LmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+U2lnbmVkLW9mZi1ieTogSmFnaGF0aGlzd2FyaSBSYW5rYXBwYWdv
dW5kZXIgTmF0YXJhamFuICZsdDs8YSBocmVmPSJtYWlsdG86amFnaHVAZ29vZ2xlLmNvbSI+amFn
aHVAZ29vZ2xlLmNvbTwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLTx3YnI+b3BwLXphaXVzLmR0cyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKzxicj4NCsKgMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyk8YnI+DQo8YnI+
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLTx3YnI+Ym1jLW9wcC16YWl1
cy5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtPHdicj5ibWMtb3BwLXphaXVzLmR0czxi
cj4NCmluZGV4IGVlZjA0NWIuLjgyYTEyZGMgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLTx3YnI+Ym1jLW9wcC16YWl1cy5kdHM8YnI+DQorKysgYi9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtPHdicj5ibWMtb3BwLXphaXVzLmR0czxicj4NCkBAIC04Myw2ICs4Myw2
OSBAQDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdwaW9zID0gJmx0
OyZhbXA7Z3BpbyBBU1BFRURfR1BJTyhILCA3KSBHUElPX0FDVElWRV9MT1cmZ3Q7Ozxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KwqAgwqAgwqAgwqAgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgcHdtX2NvbnRyb2xsZXIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDFFNzg2MDAwIDB4NzgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQtcHdtLWNvbnRyb2xsZXImcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tfZW5hYmxlID0gL2JpdHMvIDggJmx0OzB4MDEmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrX3NvdXJjZSA9IC9iaXRzLyA4ICZs
dDsweDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlbV9wd21fY2xvY2sg
PSAmbHQ7NSAwIDk1Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBwd20wIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRk
cmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxRTc4NjAwMCAweDc4Jmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVk
LXB3bS1kZXYmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9wd20wX2Rl
ZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHB3bV9j
aGFubmVsX2VuYWJsZSA9IC9iaXRzLyA4ICZsdDsweDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwd21fdHlwZSA9IC9iaXRzLyA4ICZsdDsweDAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByaXNpbmcgPSAvYml0cy8g
OCAmbHQ7MHgwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZmFsbGluZyA9IC9iaXRzLyA4ICZsdDsweDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4N
Cis8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+QXMgQW5kcmV3IG1lbnRpb25l
ZCBpbiBhIHJlcGx5IHRvIHlvdXIgY292ZXIgbGV0dGVyLCBwbGVhc2UgZXhwbGFpbiB0aGUgc3Ry
dWN0dXJlIG9mIHRoZSBoYXJkd2FyZSBhbmQgdGhlIGRyaXZlcnMuwqAgSSBzZWUgdGhhdCB5b3Ug
YXJlIHJlcGVhdGluZyB0aGUgcmVnaXN0ZXIgYWRkcmVzcyByYW5nZSBpbiBlYWNoIHB3bVggZW50
cnkuwqAgVGhhdCBzaG91bGQgZ28gYXdheSBpZiB5b3UgbWFrZSB0aGUgcHdtWCBlbnRyaWVzIGNo
aWxkcmVuIG9mIHRoZSBwd21fY29udHJvbGxlciBlbnRyeS7CoCBJIHRoaW5rIHlvdSBjYW4gdXNl
IGFkZHJlc3MgY2VsbCBpbiB0aGUgY2hpbGRyZW4gdG8gaW5kaWNhdGUgdGhlIFBXTSBjaGFubmVs
ICMgYW5kIGxldCBwd21fY29udHJvbGxlciBtYXAgdGhhdCBiYWNrIHRvIHRoZSBjb3JyZWN0IHBo
eXNpY2FsIGFkZHJlc3MuPC9kaXY+PGRpdj7CoDxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2Nj
YyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCivCoCDCoCDCoCDCoHB3bTEgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0g
Jmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDFFNzg2MDAwIDB4NzgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQtcHdtLWRldiZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7
ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBw
aW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX3B3bTFfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHdtX2NoYW5uZWxfZW5hYmxlID0gL2JpdHMv
IDggJmx0OzB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHB3bV90eXBlID0gL2JpdHMvIDggJmx0OzB4MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJpc2luZyA9IC9iaXRzLyA4ICZsdDsweDAwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmYWxsaW5nID0gL2JpdHMvIDggJmx0
OzB4MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHB3
bTIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNl
bGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDFFNzg2MDAwIDB4NzgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQtcHdtLWRl
diZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
LW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX3B3bTJfZGVmYXVsdCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHdtX2NoYW5uZWxf
ZW5hYmxlID0gL2JpdHMvIDggJmx0OzB4MDImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHB3bV90eXBlID0gL2JpdHMvIDggJmx0OzB4MDAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJpc2luZyA9IC9iaXRzLyA4ICZsdDsw
eDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmYWxsaW5n
ID0gL2JpdHMvIDggJmx0OzB4MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHB3bTMgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFFNzg2MDAwIDB4NzgmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDthc3BlZWQtcHdtLWRldiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJs
X3B3bTNfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcHdtX2NoYW5uZWxfZW5hYmxlID0gL2JpdHMvIDggJmx0OzB4MDMmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHB3bV90eXBlID0gL2JpdHMvIDggJmx0OzB4
MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJpc2luZyA9
IC9iaXRzLyA4ICZsdDsweDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBmYWxsaW5nID0gL2JpdHMvIDggJmx0OzB4MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCsKgfTs8YnI+DQo8YnI+DQrCoCZhbXA7dWFydDUgezxicj4NCi0tPGJy
Pg0KMi44LjAucmMzLjIyNi5nMzlkNDAyMDxicj4NCjxicj4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXzx3YnI+X19fX19fX19fX19fX19fX188YnI+DQpvcGVuYm1jIG1haWxpbmcgbGlz
dDxicj4NCjxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciPm9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzwvYT48YnI+DQo8YSBocmVmPSJodHRwczovL2xpc3RzLm96bGFicy5v
cmcvbGlzdGluZm8vb3BlbmJtYyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9saXN0cy5vemxhYnMub3JnLzx3YnI+bGlzdGluZm8vb3BlbmJtYzwvYT48YnI+DQo8L2Js
b2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pg0K
--94eb2c093d7202ad4a053fe29b71--
