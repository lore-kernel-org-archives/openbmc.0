Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNCkW4QsPzDqlS
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 11:53:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tuyKR05a"; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id o9so1722987iod.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vfRfchPGMYpu4q3Lci9v1S3kzoLzr/LSbszs7KucCs8=;
 b=tuyKR05aEyG+d+gcsBUK5avDOUFCouXlGsRcHN70JInSzrNfsHOgaW8+hpfQAmP0Tg
 jBDVFnNQL/Z7LRyymtl8kO+pc3TY8E2RADxI4Dt/hY9QiudmfKpx+PDRhEZinPomTn9H
 +gtLFoKoQx63/0eMlnwSon2jhEisBzM2R7AcOfXNL/00CRbvd66bZJjTGTAD60BYTtdO
 s8JETzcSnQyCwTnnZ/knXwgX3dT5SJMyA5uSl6ST45HprOcvxTEfDlTZFAhDf6sZ/IJS
 zGzxOwAEz48yvNZIVxYSeTFZO63ksQtCJEGIcanHXXSFQcuZ+6WVMedHaPRMFN/8st8z
 Kslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vfRfchPGMYpu4q3Lci9v1S3kzoLzr/LSbszs7KucCs8=;
 b=nq79UgFOyXxCb2RpmXnLpFTfQnCsuas9cfHfZC98WY0G6Ra04O+3OvYGsAu7MKh0eN
 MEQglGVC1jtTOrI1jOXjvgvG7H6hgggu2mrxWhpuzy0XeGMH4jCDhCT/PB2TzsZf6fjN
 CzEIZ9b/l2rMZUCqf1cWd50JRXXvurTOxn2QxeR/wiQbYYA+KTPkryioNr7yP2ieXBu+
 o24U/3BLDGT17ke0/rMB8TpX2iSYCqStBrXSmfLQk1QcqMZ+Y6F1cAks7rWscW+lYlvc
 AMZXKNHAbLlS6okTfV8aHsj9GczOmeEhbHK15K1orb/qdNeJpeDFEyFMbOz6dhnCFb59
 J3Dg==
X-Gm-Message-State: AIVw111kcPI/b3/AxamSClaLYEkop+sw/bl9WOIFOwqcKYFg4Dp5rsv4
 yQq0Soe3AR8tR2u/LYHMRPSaSd6c6ift
X-Received: by 10.107.172.198 with SMTP id v189mr20482ioe.159.1501725185381;
 Wed, 02 Aug 2017 18:53:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.40.77 with HTTP; Wed, 2 Aug 2017 18:53:04 -0700 (PDT)
In-Reply-To: <5E11AC40-EE32-479D-90F2-9F684B0DBE2A@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <5E11AC40-EE32-479D-90F2-9F684B0DBE2A@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 2 Aug 2017 20:53:04 -0500
Message-ID: <CALLMt=pivzRrQFU=h7jm=-GriN2cg8XbZzCSxVHBOuWSYWW7Kg@mail.gmail.com>
Subject: Re: OpenBMC Image Management - Witherspoon
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 03 Aug 2017 01:53:08 -0000

This went live tonight in master with commit 0bf11809a80f88
(https://github.com/openbmc/openbmc/commit/0bf11809a80f8829ffc47fd0ea06ffab93199638).
This commit and any after it will now require the new PNOR update
images and process documented by Adriana below.

To make it all work well, first upgrade the BMC to the new level, then
upgrade the PNOR using the new squashfs.tar file (see directions in
doc updates on getting this).  The first time you update to using this
new PNOR image type you need to reboot the BMC after you've done the
bmc and pnor update.  After that, just boot the system up like normal.
PNOR updates now take on the order of 30s vs. 4.5 minutes!  You can
have multiple versions of PNOR loaded, with the ability to choose
which one you want at boot time, and the ability to easily patch any
of the partitions in PNOR via simple filesystem operations.

This robot test can be used directly to do the updates, or as a
reference - https://github.com/openbmc/openbmc-test-automation/blob/master/extended/code_update/code_update.robot

Switching back to older BMC code is pretty painless.  Just flash the
old BMC level then pflash your PNOR like the old days.

On Wed, Aug 2, 2017 at 12:23 PM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> This week, the support for virtual pnor on witherspoon (which reformats the
> pnor chip to ubi) will be turned on.
> REST interfaces and copying partition files for patching replace pflash for
> updating and patching the pnor.
>
> Additional details of the implementation and instructions are documented
> here:
> https://gerrit.openbmc-project.xyz/#/c/4756/
> https://gerrit.openbmc-project.xyz/#/c/5433/
>
>
> On Jun 13, 2017, at 1:10 PM, Adriana Kobylak <anoo@linux.vnet.ibm.com>
> wrote:
>
> In the next coming days, the changes to the host bios update procedure will
> be available for use.
>
> Notable changes are using a squashfs image that includes individual pnor
> partition files instead of the ffs (.pnor) image, formatting the pnor chip
> as ubi to store these files (allowing for the storage of more than one
> image), and mailbox daemon updates to support these changes (new
> phosphor-mboxd repo).
>
> Regarding the mailbox daemon, the mboxbridge repository is staying as a
> reference implementation and has been cloned into phosphor-mboxd. Any system
> using mailbox and running with a flashed ffs pnor image (instead of updating
> to the ubi layout) would still need the reference mboxbridge implementation.
> The openbmc build is being updated to build phosphor-mboxd as the default.
>
> A system can be updated transparently from running with an ffs pnor image to
> the squashfs image via the Software dbus interfaces. In a similar way, a
> system with a ubi-formatted pnor can be flashed with an ffs pnor image using
> pflash.
>
> The first round of documentation updates are here:
> https://gerrit.openbmc-project.xyz/#/c/4756/
> Reviewers welcome :)
>
>
