Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XZ4JD9ug"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fRmx6rgHzDqQw
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 10:46:09 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id p17so5138019qtl.5
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 15:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Yfn1wq+4D35tZvr5YkMGkF7znOFVGX0uAkeTltJJ9k=;
 b=XZ4JD9ugmVAXtzvsLqCtcjuZE8JxecdYyBBj5qsSGoKODhtmHZs1ec03S74ULocfhU
 M2cHsejzP9SCh3xyULLn2H8/mvV23d8jEEmuXY2TNgOT13ihNfjAJLHdnHFoQ2sGLg3K
 P1xMBDKkC9+0Ii2lNzhTlOM6x21GOCGek/Dgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Yfn1wq+4D35tZvr5YkMGkF7znOFVGX0uAkeTltJJ9k=;
 b=YRz4yc/CYqXK5HGxT57UwnE5Be+sy3PtYSm6wsZEKhPp9DoqUGvFXRH6z4V7dDvaAG
 D3r3Rc+qzJHPB+DUXHzgkdEmd/5f0aKUxY/lrIVNw/tCmCxFaPfnJiECCHVWJMq+fUgY
 DeGe7w6ZBgsH7/TCBJ6dXcvPEWiPgv20DI17N6k0y+a5+/Sxzak1jWlnqqdcugrDeLZA
 F5e2uZorCpohkzmHbG1UlpJkrhp2Ju7rZ9WaGxOak6MVJzfqoMGzZ2v73hzwchOrB+7p
 awj/6VnopCMubj89pcEmOXGSIa7eU+34fIAxkesVbhV8YA5psDQfVevYPtWzRFM5YEQ5
 3a2w==
X-Gm-Message-State: AJcUukd0DIjua1DmBYPeBtWPWkJWop52PnwsaCs88ocs1XzqjWOrIobk
 KWb9XQujbdmrW3KRgCYhnhEHSuyvrToh8NARelE=
X-Google-Smtp-Source: ALg8bN7lAO8xeVmJeJLY3IPNxw8aMjSCT3cX2evX8ezfubF3ur/js5gRI3MwBJVF43VHyAuCK5Ke7QnuAj0K+1dc69E=
X-Received: by 2002:a0c:806f:: with SMTP id 102mr4893067qva.89.1547595967504; 
 Tue, 15 Jan 2019 15:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20190114130710.427600-1-tmaimon77@gmail.com>
In-Reply-To: <20190114130710.427600-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Jan 2019 10:45:55 +1100
Message-ID: <CACPK8XfuiowoTr7+_d2tO8ZK6e3_zj=mz0XNJ9J4mGKOFPm=mg@mail.gmail.com>
Subject: Re: [linux dev-4.19 00/15] dd NPCM7xx patches to dev-4.19
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 15 Jan 2019 23:46:10 -0000

Hi Tomer,

On Tue, 15 Jan 2019 at 00:07, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Joel,
>
> Please add the following NPCM7xx patches to dev-4.19:

I applied your series and it does not compile. I am using the
npcm7xx_defconfig you included:

arm-linux-gnueabi-ld: drivers/i2c/busses/i2c-npcm7xx.o: in function
`npcm_smb_calc_crc8':
drivers/i2c/busses/i2c-npcm7xx.c:423: undefined reference to `crc8'
arm-linux-gnueabi-ld: drivers/i2c/busses/i2c-npcm7xx.o: in function
`__npcm_i2c_init':
drivers/i2c/busses/i2c-npcm7xx.c:1668: undefined reference to
`crc8_populate_lsb'
drivers/i2c/busses/i2c-npcm7xx.c:1669: undefined reference to
`crc8_populate_msb'

Please test the patchset exactly as you intend to send before sending it.

In this case you needed to add `selects CRC8` to drivers/i2c/busses/Kconfig=
.

You also have some warnings. Please send follow up patches ASAP to
resolve these:

../drivers/iio/adc/npcm_adc.c: In function =E2=80=98npcm_adc_probe=E2=80=99=
:
../drivers/iio/adc/npcm_adc.c:301:9: warning: =E2=80=98ret=E2=80=99 may be =
used
uninitialized in this function [-Wmaybe-uninitialized]
  return ret;
         ^~~

arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning (pci_bridge):
/ahb/axi-pcie@e1000000: node name is not "pci" or "pcie"
arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'pci_bridge'

I have done this for you and the tree now builds. I've merged the
patches into dev-4.19 and will push out once I've finished testing.

Cheers,

Joel
