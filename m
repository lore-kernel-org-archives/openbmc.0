Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uzkU1wa1"; 
 dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kXMv1KrSzDqM0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 02:27:06 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id i6so17694126oia.6
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e6axM6Bz8b3P4FR64CXOYeWD1ot0TF6T5fBD31uYf38=;
 b=uzkU1wa1GdBIB96jopTfpihOmGwVFjlwnuQFgN2uX68WaCuvp9wLzlyl5ub7pDQmlH
 ZsNh4xazgqr0NCw8+DhqxAR4kJ9wzVfGVjGo7/Ys1h1aCpqLGgIkG+Dxh9YbSA1X+EIr
 pZCS19nEa9ZSNUywxf3eEZoNVAimO+btIVwKvtwSkCTpLVHIwWpatgWlEYi4jhHSQPfW
 uTqibUAv6kuIfeWqiluCSBXsi6jMJJs1z+yg49WguLqsBOGcPXuhwQMqaMnsPwaxA5vI
 rILZvamQBd//RiN6BKpSf8q6oSuUljUJpcv4dWT9Cew2gZPb2eP+mnGHZdHwsnL29Pv2
 SdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6axM6Bz8b3P4FR64CXOYeWD1ot0TF6T5fBD31uYf38=;
 b=Uhpsq/PPM3Hu1FJnChTiRSiPiPiVrWtK48GMynqZuvlmk+jLtIngxL+l3PKD2S+oZu
 jA7rLTD95AfXHXbDBk9U6gnmp8923RI+Mw/umskP3dAVWuZEiiHV65+OH5eyJVvEEk+X
 NtplkHDLsrkOd1vnAQUR+RZxyrAFQuM88TEwrnPMWAa8NxHvr5lsb2vElToMs/Dd6QEk
 etElhHCqeKLwcXaw1SOlSE/9X1E4hIUoYDnaIh5Bkjnu/XB+41VCxabSFL5QssDFZQha
 uu0LTzpC6xMP/NkiYjceeuLVc8r/ukm6RRCBB2Zy2x15nwHapUiVimemwooM47F1VsYW
 A8Fg==
X-Gm-Message-State: AJcUukeCBGYHI0E+hopOum0O/CTSd+9O8ZEN+zPTq7tciHo0Q5RUcwdQ
 BLwyk6M/p/bhLAGJlWwFUgd0eh38wgGhr9XiqRY=
X-Google-Smtp-Source: ALg8bN6HZFmk0HTUb1BoeaoehIj5R8Y4eXxG75XTZa7FvACij8sw5JfF8gkskqVdwBxtuC/5KDm1NU/AGIRNgjuKKk4=
X-Received: by 2002:aca:cd48:: with SMTP id d69mr8140127oig.326.1548170824776; 
 Tue, 22 Jan 2019 07:27:04 -0800 (PST)
MIME-Version: 1.0
References: <CALLMt=rZvQ_yYHA9DmpHEbjNvaJgHPOkZ1qquxJp=ZYam-K-4Q@mail.gmail.com>
 <eff505fb-cad7-b0a4-bf1c-42b3f79905d6@intel.com>
In-Reply-To: <eff505fb-cad7-b0a4-bf1c-42b3f79905d6@intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Jan 2019 09:26:48 -0600
Message-ID: <CALLMt=rq8ykQJiqsatZrofv76mJX4g1c-Z8Ohu1J=mLGSEUuyA@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Jan 2019 15:27:08 -0000

On Mon, Jan 14, 2019 at 11:04 AM Ed Tanous <ed.tanous@intel.com> wrote:

> On 1/10/19 2:43 PM, Andrew Geissler wrote
> > Redfish defines a UpdateService schema[a]. An action available on the
> > UpdateService is a SimpleUpdate interface. I think the flow to use this would
> > look like this:
> >
> > # Retrieve the URI to upload an image to
> > HttpPushUri = GET  /redfish/v1/UpdateService
> >
> > # Upload firmware image
> > ImageURI = POST HttpPushUri
>
> As redfish is written, this is where the flow stops.  The BMC takes over
> from here, and updates itself.  One enhancement I'd really like to see
> made is to return a reference to a TaskService task, so we can track the
> progress as the update is applied.
>
> My understanding is that SimpleUpdate is a flow where the BMC can pull
> down an image itself, so the URI is generally not something local to the
> BMC, but a remote server that the BMC can connect to.

Looked like the Dell implementation was using it as a local pointer but I agree,
the specification seems to only support the remote server concept. This is
a feature we'll want (like for TFTP and such).

>
> > The main issue with the above is the loss of our ability to have multiple
> > firmware images of the same type in a system and to be able to change the
> > priority of them to switch back and forth between them. It's also not obvious
> > to me what the target is for the BIOS when doing an update of it? There are OEM
> > options for both Actions and Properties if needed (but would be great to avoid).
>
> The piece I think you're missing is the new property that was added in
> redfish UpdateService 1.1.1 named HttpPushUriTargets.  It essentially
> allows you to define multiple targets for the push flow you outlined
> above, although I don't see anyone using it yet.
>
> https://github.com/openbmc/bmcweb/blob/c0eb9bd95afa900dc808dce7c2c5fa521ba828f5/static/redfish/v1/schema/UpdateService_v1.xml#L224
>
> If you want to implement SimpleUpdate, it also supports the Targets
> property, which lets you direct where you would like a given payload to
> be updated to:
>
> https://github.com/openbmc/bmcweb/blob/c0eb9bd95afa900dc808dce7c2c5fa521ba828f5/static/redfish/v1/schema/UpdateService_v1.xml#L74
>
> One design conflict I'm seeing is that Redfish wasn't really meant to
> separate out the upload and activate interfaces.  Personally, I like the
> Redfish approach better, as it simplifies things for the user.  Loading
> a target with firmware is a single step (upload), instead of 2 (upload
> then activate).  Most of the systems I know of use the single step process.

Yeah, I'd like to stick with the default interface and I agree that the one
step process is easier. I would propose though that we add an OEM
"Priority" field so in instances where the system supports multiple
images for the same HttpPushUriTargets, the user would have an easy
way to switch back and forth. We use this a lot in development and
I know customers use it when they want to quickly roll back to a
previous update (when they were just testing out a new release or
run into issues with it). Some investigation will be required by me to
determine if the existing API's would support multiple firmware instances
for the same Target.
