Return-Path: <raltherr@google.com>
Received: from mail-wr0-x231.google.com (mail-wr0-x231.google.com
 [IPv6:2a00:1450:400c:c0c::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x41Vw25FLzDr5l
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 03:16:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="b3UJ3NTa"; 
 dkim-atps=neutral
Received: by mail-wr0-x231.google.com with SMTP id c11so55488507wrc.3
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=b+Z/YoMNK9prCBHmwDD3RCc5vVzCTLwvtVapGJAWr54=;
 b=b3UJ3NTaKxN2wz2JPXn10+iQ949Ty4GKHFjCZJlZ7O0pKbJ0ZvDsn/8ehbYRaksi6R
 Bxhwio4/Y2OKR+xWUSDNJWXuA0wnlMd2YOLHcFhpUhSzpIIPKZ7mIVqwoV6WkcWAhlbf
 hMlQL2kZhmYVA2bXr1FiKB+DlhigVHNCbk0z6dxT3Wv6CrHKyuzS0KJsTtpyYyuDBOkj
 59JxR+1StvB/2mi2+qxiVTOyoptkYAD5w5fXcGV92IzU0BlXYHGpKCUdg4i9KmDLU6B8
 XgZF7+uK9oZ6QL6dJFBf/35vyN7X+zLtRrJc0AJ7MmAFF9HYe2eCZirfittCVaOANZn1
 aoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=b+Z/YoMNK9prCBHmwDD3RCc5vVzCTLwvtVapGJAWr54=;
 b=r3y56N75LbpRCLb13EaDatchThksT0RQo9AsMZ4lJKK/VPx983xmL8bavOn+OgRAIC
 mN33RnAWJaxSDgMqr6myMS1nelwN2Rr0UY530kCcgzsVgOuwfxRmrYA9w7kbntDZPgck
 IHOUV4T1ffXoRBGNoChytLlk+NvdNtR8YzkpocDo3+YP9u2JlygmOICm6s8dk1AJKAof
 J9ErTyxufWlSg5cljp6foeYLdPKDsKwwRpJWzDnmYUZS2RcscfMMcZtHx2haOdxB1e1a
 0q5dXfB/U3HTV85+ZSXu0RH9I3tBwv5k/QPIyN1Xz951fR33ul9PIKJnW77sqkaECLDk
 c01w==
X-Gm-Message-State: AIVw112eK6yF7b51GzXoatq10jzWO1gre6WEIjAsvmieEA1orjCvK13d
 0okFN6aHMgam+bBfo/u9rKTY2H0XX1mb
X-Received: by 10.28.46.3 with SMTP id u3mr3083346wmu.68.1499447810985; Fri,
 07 Jul 2017 10:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.143.18 with HTTP; Fri, 7 Jul 2017 10:16:50 -0700 (PDT)
In-Reply-To: <20170707091241.77250-1-c_mykolak@mellanox.com>
References: <20170707091241.77250-1-c_mykolak@mellanox.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 7 Jul 2017 10:16:50 -0700
Message-ID: <CAPLgG=mFYpZcw8Y7PrSZHEx-c8kdHAqynHezfRd7ai2Nt8uWVw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] msn: add adc to msn dts.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11424c1a22a4570553bd66c0"
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
X-List-Received-Date: Fri, 07 Jul 2017 17:16:57 -0000

--001a11424c1a22a4570553bd66c0
Content-Type: text/plain; charset="UTF-8"

This doesn't match the bindings for the Aspeed ADC:
https://github.com/openbmc/linux/blob/dev-4.7/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt.


On Fri, Jul 7, 2017 at 2:12 AM, Mykola Kostenok <c_mykolak@mellanox.com>
wrote:

> Add adc for Mellanox msn platform to dts.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 45
> +++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index 0774959b1222..462a638e66c6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -139,3 +139,48 @@
>         status = "okay";
>  };
>
> +&adc {
> +       status = "okay";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       adc1 {
> +               channel = <0>;
> +               min = <677>;
> +               max = <828>;
> +       };
> +       adc2 {
> +               channel = <2>;
> +               min = <684>;
> +               max = <836>;
> +       };
> +       adc3 {
> +               channel = <3>;
> +               min = <684>;
> +               max = <836>;
> +       };
> +       adc4 {
> +               channel = <4>;
> +               min = <676>;
> +               max = <826>;
> +       };
> +       adc5 {
> +               channel = <10>;
> +               min = <691>;
> +               max = <845>;
> +       };
> +       adc6 {
> +               channel = <11>;
> +               min = <640>;
> +               max = <782>;
> +       };
> +       adc7 {
> +               channel = <12>;
> +               min = <615>;
> +               max = <751>;
> +       };
> +       adc8 {
> +               channel = <13>;
> +               min = <587>;
> +               max = <719>;
> +       };
> +};
> --
> 2.11.0
>
>

--001a11424c1a22a4570553bd66c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VGhpcyBkb2VzbiYjMzk7dCBtYXRjaCB0aGUgYmluZGluZ3MgZm9yIHRo
ZSBBc3BlZWQgQURDOsKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgv
YmxvYi9kZXYtNC43L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2Fz
cGVlZF9hZGMudHh0Ij5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9saW51eC9ibG9iL2Rldi00
LjcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYXNwZWVkX2FkYy50
eHQ8L2E+LiDCoDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPk9uIEZyaSwgSnVsIDcsIDIwMTcgYXQgMjoxMiBBTSwgTXlrb2xhIEtvc3Rl
bm9rIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmNfbXlrb2xha0BtZWxsYW5v
eC5jb20iIHRhcmdldD0iX2JsYW5rIj5jX215a29sYWtAbWVsbGFub3guY29tPC9hPiZndDs8L3Nw
YW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJn
aW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4
Ij5BZGQgYWRjIGZvciBNZWxsYW5veCBtc24gcGxhdGZvcm0gdG8gZHRzLjxicj4NCjxicj4NClNp
Z25lZC1vZmYtYnk6IE15a29sYSBLb3N0ZW5vayAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNfbXlrb2xh
a0BtZWxsYW5veC5jb20iPmNfbXlrb2xha0BtZWxsYW5veC5jb208L2E+Jmd0Ozxicj4NCi0tLTxi
cj4NCsKgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy08d2JyPm1lbGxhbm94LW1zbi5kdHMg
fCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKys8YnI+DQrCoDEgZmlsZSBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC08d2JyPmJtYy1tZWxsYW5veC1tc24uZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLTx3YnI+Ym1jLW1lbGxhbm94LW1zbi5kdHM8YnI+DQppbmRleCAwNzc0OTU5YjEyMjIuLjQ2
MmE2MzhlNjZjNiAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtPHdi
cj5ibWMtbWVsbGFub3gtbXNuLmR0czxicj4NCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC08d2JyPmJtYy1tZWxsYW5veC1tc24uZHRzPGJyPg0KQEAgLTEzOSwzICsxMzksNDggQEA8YnI+
DQrCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCsKgfTs8YnI+DQo8
YnI+DQorJmFtcDthZGMgezxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgYWRjMSB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hhbm5lbCA9ICZsdDswJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtaW4gPSAmbHQ7Njc3Jmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBtYXggPSAmbHQ7ODI4Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4N
CivCoCDCoCDCoCDCoGFkYzIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNoYW5uZWwg
PSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWluID0gJmx0OzY4NCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWF4ID0gJmx0OzgzNiZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqBhZGMzIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjaGFubmVsID0gJmx0OzMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1pbiA9ICZsdDs2ODQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1heCA9
ICZsdDs4MzYmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgYWRjNCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hhbm5lbCA9ICZsdDs0Jmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtaW4gPSAmbHQ7Njc2Jmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBtYXggPSAmbHQ7ODI2Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4N
CivCoCDCoCDCoCDCoGFkYzUgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNoYW5uZWwg
PSAmbHQ7MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1pbiA9ICZsdDs2OTEm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1heCA9ICZsdDs4NDUmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgYWRjNiB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2hhbm5lbCA9ICZsdDsxMSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbWluID0gJmx0OzY0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWF4
ID0gJmx0Ozc4MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqBhZGM3
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjaGFubmVsID0gJmx0OzEyJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtaW4gPSAmbHQ7NjE1Jmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBtYXggPSAmbHQ7NzUxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxi
cj4NCivCoCDCoCDCoCDCoGFkYzggezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNoYW5u
ZWwgPSAmbHQ7MTMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1pbiA9ICZsdDs1
ODcmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1heCA9ICZsdDs3MTkmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoH07PGJyPg0KK307PGJyPg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZv
bnQgY29sb3I9IiM4ODg4ODgiPi0tPGJyPg0KMi4xMS4wPGJyPg0KPGJyPg0KPC9mb250Pjwvc3Bh
bj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pg0K
--001a11424c1a22a4570553bd66c0--
