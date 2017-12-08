Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 600 seconds by postgrey-1.36 at bilbo;
 Sat, 09 Dec 2017 00:00:03 AEDT
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytXWR3BVrzDsF9
 for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2017 00:00:02 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP; 08 Dec 2017 04:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,377,1508828400"; d="scan'208";a="11684397"
Received: from unknown (HELO haiyuewaMOBL1) ([10.255.26.91])
 by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2017 04:40:33 -0800
From: "Haiyue Wang" <haiyue.wang@linux.intel.com>
To: =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 "'Joel Stanley'" <joel@jms.id.au>
Cc: "'Andrew Jeffery'" <andrew@aj.id.au>, "'Jeremy Kerr'" <jk@ozlabs.org>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <1512700492-22384-1-git-send-email-haiyue.wang@linux.intel.com>
 <CACPK8XfF1zSL-gF2eUWVyt3x4C1yHSqgLN5+gHH-vDTp4RomSA@mail.gmail.com>
 <000401d36fe9$013e7590$03bb60b0$@linux.intel.com>
 <CACPK8Xd1c=T5WmSE+4MD=ndk5VS4ndtGJX_mB1o-mhnF8onMxw@mail.gmail.com>
 <706c7bda-139e-5024-8648-9022815b9b9c@kaod.org>
In-Reply-To: <706c7bda-139e-5024-8648-9022815b9b9c@kaod.org>
Subject: RE: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC driver
Date: Fri, 8 Dec 2017 20:40:31 +0800
Message-ID: <000101d37021$bff766d0$3fe63470$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGMrIk0dHknVINADY+HTS9zGZF0lwHX1CNxATW5h30BfiQ5eAKz4mbio4zqVhA=
Content-Language: en-us
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDlmM2NjMDktNTk4NC00YzE0LWE0M2YtN2UxOTM0YTJlMjI2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJcL1JEWEJwWW5acCtvQ3F2R2RDZUw3bXhUWldKOTUyWTkzRFN6TXVjYzFUZlA4OG9icUc3WkpzK2pyYzMyYzNlSiJ9
x-ctpclassification: CTP_IC
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: request-justification,no-action
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 13:00:04 -0000

Thanks C. 'linux-aspeed' should be a good reviewer. :)


Hi Andrew & Joel,

> @@ -94,8 +107,22 @@ lpc: lpc@1e789000 {
>         ranges =3D <0x0 0x1e789000 0x1000>;
>
>         lpc_bmc: lpc-bmc@0 {

Ah, the lpc-bmc node. This is Andrew's work, please add him to CC in the =
future so he can help review.

> -               compatible =3D "aspeed,ast2500-lpc-bmc";
> +               compatible =3D "aspeed,ast2500-lpc-bmc"; "simple-mfd", =

> + "syscon";

  >> Can you explain why we add the simple-mfd property here? The lpc =
device already has this, which enables us to have a regmap across the =
address space. If there's a further requirement then please explain it.
=20
  Haiyue: I tried to remove this property, found that we had to add =
"simple-mfd" property into "aspeed,ast2500-lpc-bmc" node. If not, the =
nested node kcs1/2/3 can't be loaded successfully.

>                 reg =3D <0x0 0x80>;
> +               reg-io-width =3D <4>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges =3D <0x0 0x0 0x80>;
> +
> +               kcs3: kcs@3 {

 >> It's convention that the unit name has a corresponding reg property.
      =20
 >> It looks like you should use reg =3D <3>, which means you don't need =
the custom kcs_chan property.

 Haiyue: I added the ' reg =3D <0x0 0x80> ' property for memory/io space =
use, and use 'kcs_chan' for channel selection in kcs driver.

> +                       compatible =3D "aspeed,ast2500-kcs-bmc";
> +                       interrupts =3D <8>;
> +                       kcs_chan =3D <3>;
> +                       kcs_regs =3D <0x2C 0x38 0x44>;

I suggest placing these register offsets in the driver.

There are a number of channel specific offsets, registers and masks that =
need to be specified. From what I can see you specify some here in the =
device tree, and others are selected in the switch statements in your =
code. It's a good goal to make a code generic with the hardware =
differences specified in the device tree, but in this case it's not =
worth it.

I suggest a data structure that contains the registers, enable bits and =
mask, address bits and mask, etc. This way you can store a pointer to =
that data structure containing all of the information, and you don't =
need the switch statements in the code.

struct kcs_channel {
      u32 idr;
      u32 odr
      u32 str;
      u32 en_reg1;
      u32 en_mask1;
      u32 en_reg2;
      u32 en_mask2;
};

static const struct kcs_channels[4] =3D
  { .idr =3D 0x2C,
    .odr =3D 0x38,
    .str =3D 0x44,
    .en_reg1 =3D LPC_HICR2,
    .en_mask1 =3D LPC_HICR2_IBFIF3

etc.

Haiyue: This makes code and device tree more clean, I over-used the =
device tree. :-). And I defined bellowing, and kept the enable/disable =
channel
as before. Because you can see that enable / disable have the register =
setting with different order, and registers number are different also. =
So for
making the code clean, and let people easily understand the code by =
checking data sheet, I kept this. :)

/* IPMI 2.0 : 9.5 - KCS Interface Registers */
struct kcs_ioreg {
	u32 idr;
	u32 odr;
	u32 str;
};

static const struct kcs_ioreg kcs_channel_ioregs[KCS_CHANNEL_MAX] =3D {
	{ .idr =3D 0x24, .odr =3D 0x30, .str =3D  0x3C },
	{ .idr =3D 0x28, .odr =3D 0x34, .str =3D  0x40 },
	{ .idr =3D 0x2C, .odr =3D 0x38, .str =3D  0x44 },
	{ .idr =3D 0x94, .odr =3D 0x98, .str =3D  0x9C },
};

static void kcs_enable_channel(struct kcs_bmc *kcs_bmc, int enable)
{
	switch (kcs_bmc->chan) {
	case 1:
		if (enable) {
			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
					LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
					LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
		} else {
			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
					LPC_HICR0_LPC1E, 0);
			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
					LPC_HICR2_IBFIF1, 0);
		}
		break;

	case 2:
		if (enable) {
			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
					LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
					LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
		} else {
			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
					LPC_HICR0_LPC2E, 0);
			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
					LPC_HICR2_IBFIF2, 0);
		}
		break;

	case 3:
		if (enable) {
			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
					LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
					LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
			regmap_update_bits(kcs_bmc->map, LPC_HICR4,
					LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
		} else {
			regmap_update_bits(kcs_bmc->map, LPC_HICR0,
					LPC_HICR0_LPC3E, 0);
			regmap_update_bits(kcs_bmc->map, LPC_HICR4,
					LPC_HICR4_KCSENBL, 0);
			regmap_update_bits(kcs_bmc->map, LPC_HICR2,
					LPC_HICR2_IBFIF3, 0);
		}
		break;

	case 4:
		if (enable) {
			regmap_update_bits(kcs_bmc->map, LPC_HICRB,
					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
		} else {
			regmap_update_bits(kcs_bmc->map, LPC_HICRB,
					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
					0);
		}
		break;

	default:
		break;
	}
}

BR,
Haiyue




-----Original Message-----
From: C=C3=A9dric Le Goater [mailto:clg@kaod.org]=20
Sent: Friday, December 8, 2017 16:12
To: Joel Stanley <joel@jms.id.au>; Haiyue Wang =
<haiyue.wang@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>; Jeremy Kerr <jk@ozlabs.org>; =
OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC =
driver

On 12/08/2017 07:01 AM, Joel Stanley wrote:
> On Fri, Dec 8, 2017 at 4:24 PM, Haiyue Wang =
<haiyue.wang@linux.intel.com> wrote:
>> Great notes, will update a new patch later, thanks Joel.
>>
>> I implemented the kcs by referenced the upstream bt driver. And the=20
>> upstream maintainer is as bellowing, I hope the openbmc expert to=20
>> review my patch firstly, will send to the maintainer soon. :-)
>>
>> ./scripts/get_maintainer.pl drivers/char/ipmi/bt-bmc.c Corey Minyard=20
>> <minyard@acm.org> (supporter:IPMI SUBSYSTEM)=20
>> openipmi-developer@lists.sourceforge.net (moderated list:IPMI=20
>> SUBSYSTEM) linux-kernel@vger.kernel.org (open list)
>=20
> Yep, add to that list:
>=20
> openbmc@lists.ozlabs.org
> clg@fr.ibm.com
> jk@ozlabs.org
> andrew@aj.id.au
> joel@jms.id.au

and what about the linux-aspeed@lists.ozlabs.org ?=20

C.

> In the past we have spent a long time pre-reviewing on the openbmc=20
> list, and then had another extensive review process on the upstream=20
> list. I hope it will help us get the code in a mergeable state faster=20
> by doing the work upstream, with the OpenBMC team providing input.
>=20
> Cheers,
>=20
> Joel
>=20
