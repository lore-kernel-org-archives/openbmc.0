Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RsafYoXG"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V2xc3P9VzDqf3
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 03:39:15 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id f18-v6so1085886pgv.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=XZItRMC3+hVLG8xMmwwdbGb1FBRFy/rF4I+RkylD6b4=;
 b=RsafYoXGnofbnI5PsWCUXz3VwYBO+JltugW01byEKSsG9WDB3l3vWA5BYs7B6+R+1a
 b31VXjv874kN9WX4qokWj9NPapvPFBKSqPxYUNsXhz2ijZN6gN3BEBqlpFa83pyvXIdL
 2EEaR92ItfsH1IAYAnuh8e1VoA1AKElUlSFq44GcosfdMY1PhfEmP7VhVS8KLUsJqr0C
 L1aNqViQWn3xzbQ/vqDwRjgMlyvuAUruVo/qg+AqVYvBcEw3gn5V2H1GquGL0Zy+d335
 vTvWHHC/reXg6pxhhQRy6Uqb/IfQujiLy032+Y5oDhJye9Onjt1fNzvsl/FQmTJ8I0kP
 6yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=XZItRMC3+hVLG8xMmwwdbGb1FBRFy/rF4I+RkylD6b4=;
 b=Zf014PlTzGwrGx6K/SpX1Mo+FktcxHn9AXSbKoQlDPCvHtRFZ7HRrK35/HMrE/voaD
 nCdggb6pbbf2qwzxvtTePe66SPbOGNDAM54PAQfrfpFPOZQ/N8DQcDvLENY+PKGpp2D1
 Ot9RugmEteJBuxGcS450YzqeqeW4FXEtZEgHvz3ptUNSZ0ZfGjLF646C2Xt+iUdeaFuU
 q3CQMIqlA/FINcosKBaXaTOmDqTgX3/hl1vnlp67KYB0W/g9ja4DhYqxk2JdMK6MX4ss
 kp454j10jT8eB5s4T3LvxBMDpm9F78hfNkW3zHYm0Fjo3ThXlTpfgFF/UVk694g+Ydp8
 Mggg==
X-Gm-Message-State: ABuFfoghX0lZ3SomWcqfAaqTu4NpySPRLPl+DFBT4ZnPKakr1vPxREty
 mlLLJJTZ1apNvY9ybCSAW4XYIvCXMK6SfwdCuhbvxg==
X-Google-Smtp-Source: ACcGV616dCbMtUZ4o7mZt2wFm4k1fUecpWVguTUE8mWzl2cosNPld2fu5te3LHfjnVNwhyg8FTePsu70Oihw5e2l9HU=
X-Received: by 2002:a63:9507:: with SMTP id
 p7-v6mr26531397pgd.449.1539103153039; 
 Tue, 09 Oct 2018 09:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
 <OFB2E13EB3.61719782-ON00258320.00188DA9-00258320.0018D968@notes.na.collabserv.com>
 <CAO=notw=12OD1PRaOh1G7iWxgd-D_oU6FXy_Tyj5Gjnv2TFdww@mail.gmail.com>
 <OF52FCD065.2F4D9B00-ON00258320.00521B13-00258320.00525C58@notes.na.collabserv.com>
 <CAO=notyEVo_o+BazyRAvqBD6uW6QTj4azLBcOfutzuZ7=L8mPg@mail.gmail.com>
 <CAO=notxBdVwRNTc2-tHQW_H+KTHBJTn64os9OnFRCeD2EQtJag@mail.gmail.com>
 <OF8FA802D2.4C9B6633-ON00258321.00148559-00258321.0014855D@notes.na.collabserv.com>
In-Reply-To: <OF8FA802D2.4C9B6633-ON00258321.00148559-00258321.0014855D@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Oct 2018 09:39:01 -0700
Message-ID: <CAO=notydThsUDN+8Vw1KLGh1YmLnS-S9fzvMGr=sk3WwHsSV1Q@mail.gmail.com>
Subject: Re: In-band IPMI Update over IPMI Blobs
To: Sivas Srr <sivas.srr@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 09 Oct 2018 16:39:17 -0000

On Mon, Oct 8, 2018 at 8:44 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:
>
> Our parent wiki, Patrick.
> https://github.com/openbmc/openbmc/wiki

I don't see a mechanism for comment or review with wiki pages, so I
think it makes more sense to publish the design to openbmc/docs with
the testing details etc, as a review and gather comments.

>
>
> ----- Original message -----
> From: Patrick Venture <venture@google.com>
> To: Sivas Srr <sivas.srr@in.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Cc:
> Subject: Re: In-band IPMI Update over IPMI Blobs
> Date: Tue, Oct 9, 2018 4:54 AM
>
> On Mon, Oct 8, 2018 at 4:23 PM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Oct 8, 2018 at 7:59 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> > >
> > > Yes Patrick, Would like to have Wiki for each function.
> > >
> > > And would like to see following in that:
> > >
> > >
> > > Use case scenarios
> > > Requirements
> > > Design
> > > Test Cases - Unit / Functional
> >
> > So which wiki should I use?
> >
> > >
> > >
> > >
> > >
> > >
> > > ----- Original message -----
> > > From: Patrick Venture <venture@google.com>
> > > To: Sivas Srr <sivas.srr@in.ibm.com>
> > > Cc:
> > > Subject: Re: In-band IPMI Update over IPMI Blobs
> > > Date: Mon, Oct 8, 2018 7:55 PM
> > >
> > > On Sun, Oct 7, 2018 at 9:31 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> > > >
> > > > Nice Patrick, As discussed in test work group meeting,
> > > > Shall we have this feature with identified
> > > > Use case Scenarios -> Requirement -> Design -> Test cases
> > > >
> > > > Because code update is the feature which all end users will do at least once.
> > > > We can have a wiki as IPMI Inband code update and then populate design over there.
> > > > Once design is baselined, we can move it under presentations / document of github.
> > > >
> > > > Please let know your thoughts.
> > >
> > > I don't understand your email.  Are you saying there should be a wiki
> > > where the design lives while it's under review?  Or are the test cases
> > > going under the wiki?  And isn't it all under github?
> > >
> > > >
> > > >
> > > >
> > > > ----- Original message -----
> > > > From: Patrick Venture <venture@google.com>
> > > > Sent by: "openbmc" <openbmc-bounces+sivas.srr=in.ibm.com@lists.ozlabs.org>
> > > > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > > > Cc:
> > > > Subject: In-band IPMI Update over IPMI Blobs
> > > > Date: Fri, Oct 5, 2018 8:16 PM
> > > >
> > > > For those who have been watching, we have been upstreaming how we
> > > > currently handle in-band updates over IPMI/LPC/PCI to
> > > > phosphor-ipmi-flash.  However, recently we also upstreamed a generic
> > > > blob interface, phosphor-ipmi-blobs.  Until
> > > > https://gerrit.openbmc-project.xyz/13620 it wasn't a suitable
> > > > mechanism for the firmware update due to an inability to do a clean
> > > > method mapping between the protocols.
> > > >
> > > > I've written up a proposal (downstream for now) to port the
> > > > phosphor-ipmi-flash implementation into a blob handler that just goes
> > > > through phosphor-ipmi-blobs.  The thinking is to have more things
> > > > leverage the generic blob handler instead of having a fully separate
> > > > OEM IPMI command set for everything (although phosphor-ipmi-flash goes
> > > > over the Firmware Netfn).
> > > >
> > > > It's now a pretty trivial transformation, and once the design has some
> > > > age downstream (1-2 days :D), then I'm going to send it here for
> > > > review.
> > > >
> > > > Unless there are obvious objections.
> > > >
> > > > And as food for thought, other Blob protocol use-cases in the works:
> > > > - mechanism for downloading core dumps and crash logs over IPMI (no
> > > > network access)
> > > > - mechanism for sending commands down for special hardware
> > > > - mechanism for reading back configuration files for whitelisted debug
> > > > - mechanism for randomly creating large files such that the flash
> > > > fills up and the system never boots again.
> > > >
> > > > Patrick
> > > >
> > > >
> > > >
> > >
> > >
> > >
> +OpenBMC Maillist
>
>
>
