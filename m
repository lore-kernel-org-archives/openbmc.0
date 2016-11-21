Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCt4VNZzDvjw
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nK0a285q"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so20839404oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ggPZWbl/YID9OggtbCsv709K7sCdbtIS4mCwh/ej8iU=;
 b=nK0a285qrk1UH6x5x0gk1VCbWg9VgjQ/4bRJqWsG2MbSOVQtWOE1TUkSD/TtvK7u5x
 vpanA6mkg+pO2um6skAQMFThnCdeRUJre9Cq/iA0S4CATccNIKZ5jllGAZEubzB5lx8H
 /6DkSb3tc6OISEDs7WgVUNkoHmaoivBat9TZ5x4jCCfeZzmlWyi5LeOeJVypfXFniBW5
 MgUcsMvToogscB0ZVvPmxQOTaCDdlB+xzYaxueTGmD9op6ymW+y7axx44be19M0YvrMo
 4sGC9S+OAX4YLwoxRVsudPWF1D+BkRw++x2nlfgtw0TT9UavYWI9c2zMecGwVIQSkkD/
 MvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ggPZWbl/YID9OggtbCsv709K7sCdbtIS4mCwh/ej8iU=;
 b=egq/ImN1qxf+K+OcMyc2eCKJMDDZXpB+RZMFkfEfPWFsyXV6SsT+uhN0oVJgbg39/3
 EtJMrAJFkNSWnf8q3exSEU3tlYJBewv411Hz+9cUEYlQP7+Clqddc2euJGhxbIP6jPyj
 wOECW5WXnZMfr8vi6/j77wEBYAw2wfVc7rWP2r2JGsuHNBQkGfzZYsCTSghysZSU+kT1
 WUclkqHJ4qbv7aiXbQof8KOCKulzCX/rCgCQQeZe2LLXcdiXwRZa16flHPzH9YlCE8TP
 uOn1G42zr/HYX/OCkBGFCbAPF0/O7ObRUuxMkqjZraAuEoVJjhGiphucybWMO1Prs8iH
 wJ9g==
X-Gm-Message-State: AKaTC025tDH+OteZkFmHRd4wbd8PN+Y/A2EeTy+nn0CwHK9VG736vbI8xE68RpAyW6x1SoewvxX0oxtizOiWrA==
X-Received: by 10.157.17.26 with SMTP id g26mr7363154ote.230.1479713240836;
 Sun, 20 Nov 2016 23:27:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:27:00 -0800 (PST)
In-Reply-To: <1479478938-13267-24-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-24-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:57:00 +1030
X-Google-Sender-Auth: kWbRExBTTvboqvugrxZ9EeDHh2s
Message-ID: <CACPK8XeAGarVEu1r8GGmPZJnSo_3O_wrwjkZkJF9Tijqaz9yhw@mail.gmail.com>
Subject: Re: [PATCH qemu 23/38] block: add a model option for MTD devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:23 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> This could be used to define the flash model to use on some boards
> definitions.

Nice, I like it.

Could we add an option specify the mac/ncsi setup of the system too?
Some hardware will have a NCSI device on one MAC and a PHY on the
other. It would be handy to be able to test those without adding a new
board.

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  blockdev.c                | 13 +++++++++++++
>  include/sysemu/blockdev.h |  1 +
>  qemu-options.hx           |  4 +++-
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 245e1e1d177a..fcea923edf02 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -742,6 +742,10 @@ QemuOptsList qemu_legacy_drive_opts =3D {
>              .type =3D QEMU_OPT_STRING,
>              .help =3D "pci address (virtio only)",
>          },{
> +            .name =3D "model",
> +            .type =3D QEMU_OPT_STRING,
> +            .help =3D "flash model (mtd only)",
> +        },{
>              .name =3D "serial",
>              .type =3D QEMU_OPT_STRING,
>              .help =3D "disk serial number",
> @@ -790,6 +794,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfa=
ceType block_default_type)
>      bool read_only =3D false;
>      bool copy_on_read;
>      const char *serial;
> +    const char *model;
>      const char *filename;
>      Error *local_err =3D NULL;
>      int i;
> @@ -1030,6 +1035,13 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInte=
rfaceType block_default_type)
>          g_free(new_id);
>      }
>
> +   /* Add virtio block device */
> +    model =3D qemu_opt_get(legacy_opts, "model");
> +    if (model && type !=3D IF_MTD) {
> +        error_report("model is not supported by this bus type");
> +        goto fail;
> +    }
> +
>      /* Add virtio block device */
>      devaddr =3D qemu_opt_get(legacy_opts, "addr");
>      if (devaddr && type !=3D IF_VIRTIO) {
> @@ -1102,6 +1114,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInter=
faceType block_default_type)
>      dinfo->unit =3D unit_id;
>      dinfo->devaddr =3D devaddr;
>      dinfo->serial =3D g_strdup(serial);
> +    dinfo->model =3D g_strdup(model);
>
>      blk_set_legacy_dinfo(blk, dinfo);
>
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 16432f350805..10c66e5e86a4 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -39,6 +39,7 @@ struct DriveInfo {
>      int cyls, heads, secs, trans;
>      QemuOpts *opts;
>      char *serial;
> +    char *model;
>      QTAILQ_ENTRY(DriveInfo) next;
>  };
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 4a5b29f349f7..16add85bd0f5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -517,7 +517,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
>      "-drive [file=3Dfile][,if=3Dtype][,bus=3Dn][,unit=3Dm][,media=3Dd][,=
index=3Di]\n"
>      "       [,cyls=3Dc,heads=3Dh,secs=3Ds[,trans=3Dt]][,snapshot=3Don|of=
f]\n"
>      "       [,cache=3Dwritethrough|writeback|none|directsync|unsafe][,fo=
rmat=3Df]\n"
> -    "       [,serial=3Ds][,addr=3DA][,rerror=3Dignore|stop|report]\n"
> +    "       [,serial=3Ds][,model=3Dm][,addr=3DA][,rerror=3Dignore|stop|r=
eport]\n"
>      "       [,werror=3Dignore|stop|report|enospc][,id=3Dname][,aio=3Dthr=
eads|native]\n"
>      "       [,readonly=3Don|off][,copy-on-read=3Don|off]\n"
>      "       [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unmap]\n"
> @@ -570,6 +570,8 @@ the format.  Can be used to specify format=3Draw to a=
void interpreting
>  an untrusted format header.
>  @item serial=3D@var{serial}
>  This option specifies the serial number to assign to the device.
> +@item model=3D@var{model}
> +This option specifies the model to use to create a flash device (if=3Dmt=
d only).
>  @item addr=3D@var{addr}
>  Specify the controller's PCI address (if=3Dvirtio only).
>  @item werror=3D@var{action},rerror=3D@var{action}
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
