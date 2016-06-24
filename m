Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNFD5cRSzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:53:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NjGqqGQy; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id a186so18947092qkf.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tnS9CZRmpUBglmv3dAWb/pP/ThlFJ5+tck5+de4ljCU=;
 b=NjGqqGQyiOGqLvxJkmNon+DQIgystOLdUegvNlKkmba3bb9o/Q1DuHzbln868rpk5I
 2lvXl49uuT23LcHlkibZLmPcGjTdReRKsIz0mSUH5kl3aHAYOBt/Y25kMuQSbqJpv1U/
 lmDV+h3QleVLnIDerV47Pqy29ZBFhgNYiqUxpK51rRQhS6MahECuzcX4yj1pOV9e0EeD
 WUnA/3q28HHgFGrIAdk8uPgOdUorJSmD09GracPHNyVLdmOEto+N6JmDEwz8OwDHwE5Z
 WFj+e73TRgIZoys67szQ8CWZzqPJhk2pEd8A7Tt9TPR//KTf/yyNoVAOvNfqIxj5mfx2
 DG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tnS9CZRmpUBglmv3dAWb/pP/ThlFJ5+tck5+de4ljCU=;
 b=QLomqzL5UWscn3W2qUc0Co8DYV5uUur1UUVppTbmavfAFAyqKmiHMDDgPpXYlrQMZe
 0/9YYQRkV18qFSeJqPM2waQ+98B1fvQqS8va4/PXcmC8eOg1+avCvplgagKiYbRApYxm
 w3Gm+Failzzl9elCkH0fCunQQNmIfy6HXc9hZkFLltKnKbhqNCms2JxNyXg1sGxrrp88
 Vsq1+Nt5b59N2PP7c6q73wT0vSOaK2+eix02Ct07vYnmNv5IFQNt63vHxxrkilEvzLCr
 uhmb2jeAzkm3ChV/n/O5eA/mvG/Jyinu8vycjjsL4MVG21dSfrKhDlJsOpGkvORl7tOI
 nBgQ==
X-Gm-Message-State: ALyK8tJvSwbZ9Cw7y9tDQqLJ72OnbtgXdVsVpKDBk9jvG9hXLdTQBb1MYz/q0PMCXmsHW5rXLJblZt0xfTZO+A==
X-Received: by 10.55.152.198 with SMTP id a189mr1972373qke.208.1466736814917; 
 Thu, 23 Jun 2016 19:53:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:53:15 -0700 (PDT)
In-Reply-To: <20160623204033.13165-6-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-6-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:23:15 +0930
X-Google-Sender-Auth: Msb5EprBuX2VG8InbcZ6LtWZPII
Message-ID: <CACPK8XdJ3u5mSnG61ZSaUkN=RZefAC4RzZ-mFEibJpi8zrFx6g@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 05/11] meta-phosphor: Ensure INITRAMFS_CTYPE
 defined
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 02:53:37 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> The hardware platforms use obmc-bsp-common.inc, which defines
> INITRAMFS_CTYPE, but the simulation (qemu) platforms do not.
> core-image-minimal-initramfs.bbappend currrently uses INITRAMFS_CTYPE
> so we need to make sure it is defined.  Default there to 'lzma' if not
> already defined.
>

Should it default to none if it's not defined? How do we make sure the
kernel has decompression for this type enabled?

> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Acked-by: Joel Stanley <joel@jms.id.au>


> ---
>  .../common/recipes-core/images/core-image-minimal-initramfs.bbappend     | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend b/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
> index 90a1c3f..5710d22 100644
> --- a/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
> +++ b/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
> @@ -1,3 +1,4 @@
>  PACKAGE_INSTALL_remove = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi"
>  PACKAGE_INSTALL += "obmc-phosphor-initfs"
> +INITRAMFS_CTYPE ?= "lzma"
>  INITRAMFS_FSTYPES = "cpio.${INITRAMFS_CTYPE}"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
