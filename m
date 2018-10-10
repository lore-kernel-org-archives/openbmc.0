Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="t7JjuFXC"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VHSs2xPBzF12d
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 13:03:40 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id r64-v6so1779247pfb.13
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 19:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JSZpsKs5C8qNyoG/3MvkvOCC6gLILUdD3Q33EbL5nis=;
 b=t7JjuFXC5sg7vLlm9DqiVzHd75A/E2vUixZC6IpF8znzS2B2BJcFWiEKOPpLhGpmP0
 UwCeULUdZCqqa3j/QBJw2GUEPFFyUvULdKImv49EU5w/usWBRfEGmR2ZHhtBTihnX74r
 gbKqDK3Q6lAnj1gs0m1CpuT47OnVsJsryH/R4erS0s0uYhUbRrRZw3n83sTAc+sfXbEL
 uX2Dt0o9SW4vJ7s9UDsYNyWiEblvTYpQgWz7LbqCsDT8FxmJ5RO3wW2aDaGKO/1pTWY6
 pnj16GT5bktrj2gyqwAF3QCAi4p0QP0KXo0VIu7z+sT4ey5vcAcNEP58iQJxle726BdN
 lBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JSZpsKs5C8qNyoG/3MvkvOCC6gLILUdD3Q33EbL5nis=;
 b=lHqGs5PCdON4JVYIhP6xgnwahbRD5cKbxeVkEmqacHNx+803cwSVtuZJKCdmj+iqVm
 JaPSEXnTeqJyX6o9pwjaPWuxOGQeape/mn+oIKD/FO2VAbi0iH1hnlyNF/7gxVRi2uCT
 Y412HBKhOeXWsVMtdIgwpkdtE60X21/e33HOFg3P5Vp1k6KGfJDerdpHHikPkY4T+yEM
 GEoAfClfURYrKeLfEp5LnP5YhhI50S6ctm7W3zICHxPgkn3LeWS5hIrWBrBqXqi5sD+U
 OEVX1V/rQyCBlDrrtkmuBTjxvrrWzwwc+7ivnx/qANrArpsT/oZL5kHKUnNyB4IcRLaB
 YpNQ==
X-Gm-Message-State: ABuFfoghxMdxrpzKMRlQengCq4PS+KVEmUBen4JyL4zUaysI4R0SljlY
 tosIzEqdN5hET42liPqw7twb4FR0Kes/mjrqkld+xg==
X-Google-Smtp-Source: ACcGV61aYsX8Gp1Jdkjkeq8Zd3LG2Onz9jHBFUPtUOCcHIslMw1krmlimKnzgpFT1BjZMyg5O5r+gVlpF3S0sE+IXYI=
X-Received: by 2002:a62:c502:: with SMTP id
 j2-v6mr33544657pfg.194.1539137018492; 
 Tue, 09 Oct 2018 19:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
 <OFB2E13EB3.61719782-ON00258320.00188DA9-00258320.0018D968@notes.na.collabserv.com>
 <CAO=notw=12OD1PRaOh1G7iWxgd-D_oU6FXy_Tyj5Gjnv2TFdww@mail.gmail.com>
 <OF52FCD065.2F4D9B00-ON00258320.00521B13-00258320.00525C58@notes.na.collabserv.com>
 <CAO=notyEVo_o+BazyRAvqBD6uW6QTj4azLBcOfutzuZ7=L8mPg@mail.gmail.com>
 <CAO=notxBdVwRNTc2-tHQW_H+KTHBJTn64os9OnFRCeD2EQtJag@mail.gmail.com>
 <OF8FA802D2.4C9B6633-ON00258321.00148559-00258321.0014855D@notes.na.collabserv.com>
 <CAO=notydThsUDN+8Vw1KLGh1YmLnS-S9fzvMGr=sk3WwHsSV1Q@mail.gmail.com>
 <OFA53F09B0.66FB304B-ON00258321.0063F01E-00258321.00640BBE@notes.na.collabserv.com>
In-Reply-To: <OFA53F09B0.66FB304B-ON00258321.0063F01E-00258321.00640BBE@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Oct 2018 19:03:23 -0700
Message-ID: <CAO=notyRDG3LTsCUZtK-oBfV8VkXgFH4GySRTyih2xye6hb_WA@mail.gmail.com>
Subject: Re: In-band IPMI Update over IPMI Blobs
To: Sivas Srr <sivas.srr@in.ibm.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 02:03:42 -0000

On Tue, Oct 9, 2018 at 11:12 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
>
> May be baselined document link can be populated in wiki for a given function, with both design doc / test plan doc.
>
> Or as mentioned by you (Patrick) in same document, we can have test details as well. All at one place.

I should have it under review tomorrow.  I'm also going to try and
finish out phosphor-ipmi-flash which is an upstreaming effort of how
we currently handle in-band updates.  The version that uses blob, that
design actually just routes the commands phosphor-ipmi-flash expects
in its design through the blob protocol.

>
>
> ----- Original message -----
> From: Patrick Venture <venture@google.com>
> To: Sivas Srr <sivas.srr@in.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Cc:
> Subject: Re: In-band IPMI Update over IPMI Blobs
> Date: Tue, Oct 9, 2018 10:09 PM
>
> On Mon, Oct 8, 2018 at 8:44 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> >
> > Our parent wiki, Patrick.
> > https://github.com/openbmc/openbmc/wiki
>
> I don't see a mechanism for comment or review with wiki pages, so I
> think it makes more sense to publish the design to openbmc/docs with
> the testing details etc, as a review and gather comments.
>
> >
> >
> > ----- Original message -----
> > From: Patrick Venture <venture@google.com>
> > To: Sivas Srr <sivas.srr@in.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Cc:
> > Subject: Re: In-band IPMI Update over IPMI Blobs
> > Date: Tue, Oct 9, 2018 4:54 AM
> >
> > On Mon, Oct 8, 2018 at 4:23 PM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Mon, Oct 8, 2018 at 7:59 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> > > >
> > > > Yes Patrick, Would like to have Wiki for each function.
> > > >
> > > > And would like to see following in that:
> > > >
> > > >
> > > > Use case scenarios
> > > > Requirements
> > > > Design
> > > > Test Cases - Unit / Functional
> > >
> > > So which wiki should I use?
> > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > ----- Original message -----
> > > > From: Patrick Venture <venture@google.com>
> > > > To: Sivas Srr <sivas.srr@in.ibm.com>
> > > > Cc:
> > > > Subject: Re: In-band IPMI Update over IPMI Blobs
> > > > Date: Mon, Oct 8, 2018 7:55 PM
> > > >
> > > > On Sun, Oct 7, 2018 at 9:31 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> > > > >
> > > > > Nice Patrick, As discussed in test work group meeting,
> > > > > Shall we have this feature with identified
> > > > > Use case Scenarios -> Requirement -> Design -> Test cases
> > > > >
> > > > > Because code update is the feature which all end users will do at least once.
> > > > > We can have a wiki as IPMI Inband code update and then populate design over there.
> > > > > Once design is baselined, we can move it under presentations / document of github.
> > > > >
> > > > > Please let know your thoughts.
> > > >
> > > > I don't understand your email.  Are you saying there should be a wiki
> > > > where the design lives while it's under review?  Or are the test cases
> > > > going under the wiki?  And isn't it all under github?
> > > >
> > > > >
> > > > >
> > > > >
> > > > > ----- Original message -----
> > > > > From: Patrick Venture <venture@google.com>
> > > > > Sent by: "openbmc" <openbmc-bounces+sivas.srr=in.ibm.com@lists.ozlabs.org>
> > > > > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > > > > Cc:
> > > > > Subject: In-band IPMI Update over IPMI Blobs
> > > > > Date: Fri, Oct 5, 2018 8:16 PM
> > > > >
> > > > > For those who have been watching, we have been upstreaming how we
> > > > > currently handle in-band updates over IPMI/LPC/PCI to
> > > > > phosphor-ipmi-flash.  However, recently we also upstreamed a generic
> > > > > blob interface, phosphor-ipmi-blobs.  Until
> > > > > https://gerrit.openbmc-project.xyz/13620 it wasn't a suitable
> > > > > mechanism for the firmware update due to an inability to do a clean
> > > > > method mapping between the protocols.
> > > > >
> > > > > I've written up a proposal (downstream for now) to port the
> > > > > phosphor-ipmi-flash implementation into a blob handler that just goes
> > > > > through phosphor-ipmi-blobs.  The thinking is to have more things
> > > > > leverage the generic blob handler instead of having a fully separate
> > > > > OEM IPMI command set for everything (although phosphor-ipmi-flash goes
> > > > > over the Firmware Netfn).
> > > > >
> > > > > It's now a pretty trivial transformation, and once the design has some
> > > > > age downstream (1-2 days :D), then I'm going to send it here for
> > > > > review.
> > > > >
> > > > > Unless there are obvious objections.
> > > > >
> > > > > And as food for thought, other Blob protocol use-cases in the works:
> > > > > - mechanism for downloading core dumps and crash logs over IPMI (no
> > > > > network access)
> > > > > - mechanism for sending commands down for special hardware
> > > > > - mechanism for reading back configuration files for whitelisted debug
> > > > > - mechanism for randomly creating large files such that the flash
> > > > > fills up and the system never boots again.
> > > > >
> > > > > Patrick
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > >
> > +OpenBMC Maillist
> >
> >
> >
>
>
>
