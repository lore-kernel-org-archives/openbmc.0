Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DlXWz/N3"; 
 dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zVFN3mPyzDqM5
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 04:36:24 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id z19so5872345otm.2
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 09:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oi3L8VGVQWDonRivjILiZfZ0yIPqMUNebd9MmtPqGYc=;
 b=DlXWz/N353DxYu2ORYElYE6P6Yvwlg2SUlpwkXJH1vf6p/gXh34xB/0hxupQ50N+YN
 kBknhqu7ryIbXn6KE+XS3nKxDTrcmDC6qg89Cidf0EiOWQT3xPdyI/TZQCPmowLA7x3b
 XvoD9lOd6GnJYmSmpCoN3+HzDj1cRyjdIjL3wn/s6Hoe8VSnwzv1u5zQIMdasIkAJHXr
 CfprAN54UBwSz8iCq3OTAoXOnXkcGSc7C2HBnHbVADld766DRSRprP+xF0SGltgsZG9Q
 bjAv+lJAPsmNGTw8TK9Vwuuy53LWw+ASJA8KiFQ+sQUxss/IZps45WJJj5mbgE5uroHF
 vdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oi3L8VGVQWDonRivjILiZfZ0yIPqMUNebd9MmtPqGYc=;
 b=Ti0ZbXJ2hbq/VrlAH2N1ntkYUf+SB+cynwOq6XYooy1tpb3sNUNBgTSPwedvJsVTeD
 T/4muk7iW1aBtTWSfB+lmV9Tawh8A1/s1NTfdopuqWJmf/vLngHsVb3VYOOXX1gP59V/
 +5y+rlJMnCPSL5QSQt/PEYXvV41up3H42j7W/csdH3W3ZiUTZ0+b+pM23z94zcA9CGrN
 os1/Umm0e3x5b1F7/8g/NQubYrud7nkSYVSC3vjaFa8ROwHhryxQuuLMmIGl2z+rMMb+
 ae/oelHBzSJ0Dgz3RNPUWTFYZrCUq4nE1dxsxGHqll9jJbPVCgkTo8tokyQH51IcWtg/
 6vjg==
X-Gm-Message-State: AHQUAuYpWCYz2qZr7+dIxG6MfDRxBCA7c9XKVqCPira3+BpE5i+TiB2U
 vCuuybSkKpVQfohdB1UFDMaDd2iaUxsd9EzTAbnKyn89
X-Google-Smtp-Source: AHgI3IZb51mWcIl09+ovaWIt8lZ+tbfI0c5RPNBL59I7ZChRheXckY9r+6syY/S2hIf9mgs0GwKAAYs8391HpA8LOMw=
X-Received: by 2002:a9d:7685:: with SMTP id j5mr5060542otl.150.1549992982196; 
 Tue, 12 Feb 2019 09:36:22 -0800 (PST)
MIME-Version: 1.0
References: <CALLMt=rZvQ_yYHA9DmpHEbjNvaJgHPOkZ1qquxJp=ZYam-K-4Q@mail.gmail.com>
 <eff505fb-cad7-b0a4-bf1c-42b3f79905d6@intel.com>
 <CALLMt=rq8ykQJiqsatZrofv76mJX4g1c-Z8Ohu1J=mLGSEUuyA@mail.gmail.com>
In-Reply-To: <CALLMt=rq8ykQJiqsatZrofv76mJX4g1c-Z8Ohu1J=mLGSEUuyA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 12 Feb 2019 11:36:06 -0600
Message-ID: <CALLMt=oBXo7EYZ7qXnAyxjPJH+z08GSQgdfGftwgJxMuz1DVDw@mail.gmail.com>
Subject: Re: Redfish Software Updates in OpenBMC
To: Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 12 Feb 2019 17:36:25 -0000

On Tue, Jan 22, 2019 at 9:26 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Mon, Jan 14, 2019 at 11:04 AM Ed Tanous <ed.tanous@intel.com> wrote:
>
> > On 1/10/19 2:43 PM, Andrew Geissler wrote
> > > Redfish defines a UpdateService schema[a]. An action available on the
> > > UpdateService is a SimpleUpdate interface. I think the flow to use this would
> > > look like this:
> > >
> > > # Retrieve the URI to upload an image to
> > > HttpPushUri = GET  /redfish/v1/UpdateService
> > >
> > > # Upload firmware image
> > > ImageURI = POST HttpPushUri
> >
> > As redfish is written, this is where the flow stops.  The BMC takes over
> > from here, and updates itself.  One enhancement I'd really like to see
> > made is to return a reference to a TaskService task, so we can track the
> > progress as the update is applied.
> >
> > My understanding is that SimpleUpdate is a flow where the BMC can pull
> > down an image itself, so the URI is generally not something local to the
> > BMC, but a remote server that the BMC can connect to.
>
> Looked like the Dell implementation was using it as a local pointer but I agree,
> the specification seems to only support the remote server concept. This is
> a feature we'll want (like for TFTP and such).
>
> >
> > > The main issue with the above is the loss of our ability to have multiple
> > > firmware images of the same type in a system and to be able to change the
> > > priority of them to switch back and forth between them. It's also not obvious
> > > to me what the target is for the BIOS when doing an update of it? There are OEM
> > > options for both Actions and Properties if needed (but would be great to avoid).
> >
> > The piece I think you're missing is the new property that was added in
> > redfish UpdateService 1.1.1 named HttpPushUriTargets.  It essentially
> > allows you to define multiple targets for the push flow you outlined
> > above, although I don't see anyone using it yet.
> >
> > https://github.com/openbmc/bmcweb/blob/c0eb9bd95afa900dc808dce7c2c5fa521ba828f5/static/redfish/v1/schema/UpdateService_v1.xml#L224
> >
> > If you want to implement SimpleUpdate, it also supports the Targets
> > property, which lets you direct where you would like a given payload to
> > be updated to:
> >
> > https://github.com/openbmc/bmcweb/blob/c0eb9bd95afa900dc808dce7c2c5fa521ba828f5/static/redfish/v1/schema/UpdateService_v1.xml#L74
> >
> > One design conflict I'm seeing is that Redfish wasn't really meant to
> > separate out the upload and activate interfaces.  Personally, I like the
> > Redfish approach better, as it simplifies things for the user.  Loading
> > a target with firmware is a single step (upload), instead of 2 (upload
> > then activate).  Most of the systems I know of use the single step process.
>
> Yeah, I'd like to stick with the default interface and I agree that the one
> step process is easier. I would propose though that we add an OEM
> "Priority" field so in instances where the system supports multiple
> images for the same HttpPushUriTargets, the user would have an easy
> way to switch back and forth. We use this a lot in development and
> I know customers use it when they want to quickly roll back to a
> previous update (when they were just testing out a new release or
> run into issues with it). Some investigation will be required by me to
> determine if the existing API's would support multiple firmware instances
> for the same Target.

I put a design doc up at
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18186/
I hemmed and hawed a bit on whether it was needed but figured with all
our recent community discussions, it's better to over communicate then
under.

Andrew
