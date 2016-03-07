Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 648AF1A01ED
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2016 11:33:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Hvf9E40f; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=l1U9cOie; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id r187so5896449oih.2
 for <openbmc@lists.ozlabs.org>; Sun, 06 Mar 2016 16:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XOTupNGBA2stoGeoKKYeTMY+D1rsfuzT4Mxf3W67TGI=;
 b=Hvf9E40fiPMAoHtVlYPI2GaDkSpbhrBEFEImYK5Hnq2dLRt/SLh8sOx1Oys0EwsFyW
 xwurMFRGGWtsupUzb69JPm7x5zijIZ3GEV6NYYAQ3jkNgXvklHUdBUfSeavSeQQgNcxa
 KOJvKbDuLpT1Yv7plg37+p9BOc8LTIeijlLcejPmRDngP6ABUI7ocP/GI+jjsuURAYzu
 BdKq3Xdg29ArR8jNrPFel0D5toGyxt7qELp85e+Dq2l7owwAmye3ESZgBW3F2YwaHlIW
 6E3IaVSoIN1v9PnVBtDm96CeS6NpqH+h+Bknda6ZRauSgZR8b/P7Om3uoSpRUy5diMpV
 1qzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XOTupNGBA2stoGeoKKYeTMY+D1rsfuzT4Mxf3W67TGI=;
 b=l1U9cOieZ9VC8sK5MPDiNzjCk3gvKqzETc9nVHNR2TeO1IRuyZBRgkIGIw8rtIo92Y
 mHfx0/gFTlCK/vX/uKkrL+WBRXI8/P7Oyc2crxoIIutyvrv5YdDDd1vSsgyiUpfoCAQA
 oZfjuEZ/RtAHnEQ3UOTzTQ26kSXR7DZH3kDoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XOTupNGBA2stoGeoKKYeTMY+D1rsfuzT4Mxf3W67TGI=;
 b=lo4haIh6rPlHafgvLa9RjD88nXGtrEUjT0Iwy0z4HZbjQzf5Ze4tQ9hBu8hm2nkRTR
 QMdm+FcnhdHWe8gYEJuqmsAMG9j9gDzevM7/oLJ/Gi0z4xenmH7CyA4pyGj+7vK5YZJH
 AQfioWk27Y3BOWQgPUbOpdpgT/byqm4E4OyFPdAH0FJn8r8NwVmDv+CoIkXWggzgvGc2
 ZWw23R2ZlnsnzQIcjs7bkAEfV39mzVHO0RtH8ovFTFgsyc3S/8fXxF45C8g1e8Nx8G8C
 qAnv1Z4VvXbu1iu82WbcNqZO27LR8FSaVEr7D0odqTy1kn/qg/0M5VOGxq+j0aLAO1ZY
 TrvA==
X-Gm-Message-State: AD7BkJI5JAKG+B2w03nESRlkGOcCdywSQzTfNyMpg92K+Y0l6nUnfUrWpj8Im1gI0MsUK3ISkhHkqT2nYUytig==
X-Received: by 10.202.202.87 with SMTP id a84mr12147892oig.57.1457310829683;
 Sun, 06 Mar 2016 16:33:49 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Sun, 6 Mar 2016 16:33:30 -0800 (PST)
In-Reply-To: <1457181023-23569-31-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457181023-23569-31-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Mar 2016 11:03:30 +1030
X-Google-Sender-Auth: KPZDq_ud-AfZl5RO-G3zhHcSDsI
Message-ID: <CACPK8XdiUZw01zdhAkYs=EfN73aTDiWu0KTvSQs13NoeMa2Fow@mail.gmail.com>
Subject: Re: [PATCH openbmc 30/32] init: Add a hook to download files
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2016 00:33:54 -0000

On Sat, Mar 5, 2016 at 11:00 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>
> Add a hook to run a shell command line that is stored in a u-boot
> environment variable.  Only execute this command if the previously
> established options file has a keyword trigger.  Do not even consider
> the option if a build option flag is not set to y.

This patch should not be merged. It creates a worrying backdoor into
our system where the boot process will run arbitrary commands from
untrusted u-boot variables.

If we need to set state in u-boot in order to trigger an update, then
I can imagine we might allow a flag to be set that says "do_update=1",
and the system can pick up on this and grab updates from it's
configured update source.

Cheers,

Joel

>
> This allows one to specify at u-boot commands that would download
> a read-only file system into memory for execution this boot instead
> of needing to create a custom initramfs to netboot or specifing
> debug-init-sh, entering the password, and doing the download from
> the shell.
>
> If the u-boot environment variable is empty or missing but both
> the build variable is set and the keyword trigger are set print
> a diagnostic message.  If the command fails invoke standard
> debug_takeover for corrective action.
>
> An example script:
> fw_setenv openbmcinitdownload 'cp /proc/net/pnp /run/resolv.conf ; ln -snf ../run/resolv.conf /etc/resolv.conf ; wget -O /run/image-rofs http://server.example.com/path/image-test-rofs'
> ---
>  .../obmc-phosphor-initfs/files/obmc-init.sh               | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> index 87f71e6..71a72fb 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> @@ -101,6 +101,7 @@ rwdev=/dev/mtdblock${rwfs#mtd}
>  # Set to y for yes, anything else for no.
>  force_rwfst_jffs2=y
>  flash_images_before_init=n
> +consider_openbmc_download_files=y
>
>  rofst=squashfs
>  rwfst=$(probe_fs_type $rwdev)
> @@ -131,6 +132,20 @@ then
>         debug_takeover "Debug initial shell requested by command line."
>  fi
>
> +if test "x$consider_openbmc_download_files" = xy &&
> +       grep -w openbmc-init-download-files $optfile
> +then
> +       echo "Executing download hook..."
> +       cmd="$(get_fw_env_var openbmcinitdownload)"
> +       if test -z "$cmd"
> +       then
> +               echo 2>&1 "Download command not found or empty, skipping."
> +       elif ! sh -xc "$cmd"
> +       then
> +               debug_takeover "Download command '$cmd' failed."
> +       fi
> +fi
> +
>  # If there are images in root move them to /run/initramfs/ or /run/ now.
>  imagebasename=${image##*/}
>  if test -n "${imagebasename}" && ls /${imagebasename}* > /dev/null 2>&1
> --
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
