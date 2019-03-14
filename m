Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aQogcuib"; 
 dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Kxjt0YdtzDqK1
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 05:16:31 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id i5so3906585qkd.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zJvd5jFUfrD5C9EcPBKUMcFeDmwa2BuVCLr8PQWHt5s=;
 b=aQogcuibDl9RaMcHHCeubwh0CNe/nSwDRSfIixw4dQVbdKI28XzIS6V1XvAvFngZnX
 ME9YvaylrEZhdVmTiJtFRUk4XTT6IQP8q+sNs4toC4u/6aAgyVICNjrE7iKafK47ahFS
 NmB2JJTAaJZwAt6aA6DBVmBYJ4DvqF2bVPMAwjWwHyrlfVvhUQY2sQVEDQN+IDCm3KVG
 yZuJj8afygBi7ko6XKK4YbTAlajLG9duiYhUnBHpcevxiJOzETOrokDEg8kWnKrhFXSb
 6RLJ8CiJ6xb1Spcs81VoH6p7xXX3oZSgmiSP6d9AJzjXQcu2I+i4x0GzV3HlaN906zzc
 5Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zJvd5jFUfrD5C9EcPBKUMcFeDmwa2BuVCLr8PQWHt5s=;
 b=A19XiwAQCn9nGqo/Ai5BSoyzlNAdnHzeI14f+Oi2kvqxe2Mc2phlFYhCRaamTbQSW8
 2MIcTfK7NQ0pk8aZMQh4FxQFMRORTxBp+W1z/MtbVfCbO2FDuGyRPlZ6y1VRSClAUfx8
 EOlQtD7bDVXLwPMm7QFe4Lo6C7GCtza11Ula73kK9TcZTARL04snJvqzSxSGCUggSCgC
 czboC04XQK/mZ0i8RUE7kdAReb7cSJjDWpFW5m2vgPGSXko3iy4TVDOD1h4d4xJomPyv
 0rkA9HfRCdu3hX9aZvJEkk89KV4NR+LNs9jlVqtukpEImTMS+tTXAqzik7iax3HS95ZC
 Q6zw==
X-Gm-Message-State: APjAAAWF4R6lhhYN2PR2kbzvg03UwLvESVx6ZU9jgURiDeXbtYXZ/66b
 A9gYDy5DWtouNHPsCXDgX8zG/9k+5j0ZEpokbSdmvg==
X-Google-Smtp-Source: APXvYqzdymwcOv+1coZAK6yvMq+zFvjwhGPATTy2RwYbHWuZEymos7woK7wpj8LQIywqB3teViDT464lOD7lAS+ZVeM=
X-Received: by 2002:ae9:e64d:: with SMTP id x13mr13908687qkl.112.1552587387688; 
 Thu, 14 Mar 2019 11:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQpdx2Hw=dy_pWsMYHbHvbYjj5L6j36Tp=WNnTOPDMrLg@mail.gmail.com>
 <CAJoAoZnUxBzsXRS_o-E4Z8mmDdxSA2M+BS5yo-f1RYPi5pGu-g@mail.gmail.com>
 <CAMTupoSJkv25HXUrNH4pCrjrkXhDNecykKN34j6Z7feE=Dhyug@mail.gmail.com>
In-Reply-To: <CAMTupoSJkv25HXUrNH4pCrjrkXhDNecykKN34j6Z7feE=Dhyug@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 14 Mar 2019 11:16:16 -0700
Message-ID: <CAJoAoZm0WJmb5F-kxcZR5Lyi3gKANuX3FGGXpX8d1wzg=Z36hw@mail.gmail.com>
Subject: Re: Restore MAC address to factory settings
To: Jandra A <jandraara@gmail.com>
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
X-List-Received-Date: Thu, 14 Mar 2019 18:16:35 -0000

I have made a couple comments, hope this makes sense. :)

On Thu, Mar 14, 2019 at 11:07 AM Jandra A <jandraara@gmail.com> wrote:
>
> > We have a use case for editing MAC. I don't know about factory
> > default.  So there's one (rather large) end user who would get value
>
>
> Thanks Emily! Were you able to look over the design proposal? I'd love to=
 get your feedback.
>
>
>
>
> > On Tue, Mar 12, 2019 at 12:42 PM Jandra A <jandraara@gmail.com> wrote:
> > >
> > > Hello all,
> > >
> > > I=E2=80=99d like your input on the value you see =E2=80=93 if any =E2=
=80=93 in the ability for
> > > a user to restore a MAC Address to the factory default via the GUI
> > > (Network Settings).
> > >
> > > BACKGROUND: Several end users have told us that they RARELY need to
> > > change their MAC Address, if at all. However, we=E2=80=99ve heard fro=
m several
> > > subject-matter experts that there IS value in making the MAC Address
> > > editable as well as having a way to restore it to the factory default=
.
> > >
> > > QUESTION: Is there value for the end user in being able to edit a MAC
> > > address? What about restoring it to the factory default?
> > >
> > > VIEW CURRENT DESIGN:
> > > https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networkin=
g_Mutliple_VLAN
> > >
> > > Appreciate all thoughts on this.
> >
> >
> >
> > --
> > Emily Shaffer



--=20
Emily Shaffer
