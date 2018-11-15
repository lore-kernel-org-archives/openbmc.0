Return-Path: <supreeth.venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 42wnfT52wrzF3bV
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 04:00:01 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1AF80D;
 Thu, 15 Nov 2018 08:59:59 -0800 (PST)
Received: from supven01-VirtualBox (unknown [10.119.49.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE7C93F718;
 Thu, 15 Nov 2018 08:59:58 -0800 (PST)
Message-ID: <efd97edd22ea3ddbf7fab849789ce3e8bdcd335e.camel@arm.com>
Subject: Re: MCTP protocol support in OpenBMC?
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>, Emily Shaffer
 <emilyshaffer@google.com>, "Khetan, Sharad" <sharad.khetan@intel.com>,
 Sharad <sharad.khetan@intel.com>, nilan.naidoo@intel.com, Jeremy Kerr
 <jk@ozlabs.org>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Dong Wei
 <Dong.Wei@arm.com>, David Thompson <dthompson@mellanox.com>
Date: Thu, 15 Nov 2018 10:59:56 -0600
In-Reply-To: <53D123781965AE42A2ABEE982B242E4189B6AC4E@IRSMSX102.ger.corp.intel.com>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
 <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <CAJoAoZn1uAas9jfefVnV-vSKVQ9eNUwa9+_8zv_xEPhk3_Y_ig@mail.gmail.com>
 <AM4PR08MB27887FB26B2085E206B9F04580DC0@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <53D123781965AE42A2ABEE982B242E4189B6AC4E@IRSMSX102.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 15 Nov 2018 17:00:02 -0000

On Thu, 2018-11-15 at 16:24 +0000, Rapkiewicz, Pawel wrote:
> Hi,
>  
> We’re interested in MCTP involvement, so please count us in for any
> further discussions, and WG participation.
Thanks Pawel/Sharad/Nilan for your involvement. Anyone else interested
please chime in as well.
I guess the first step is to review initial proposal (Sketches) from
Jeremy and see if we should form a WG or discuss it over the mailing
list.
>  
> Regards,
> Pawel
>  
> From: openbmc [mailto:
> openbmc-bounces+pawel.rapkiewicz=intel.com@lists.ozlabs.org] On
> Behalf Of Supreeth Venkatesh
> Sent: Thursday, November 15, 2018 4:47 PM
> To: Emily Shaffer <emilyshaffer@google.com>
> Cc: openbmc@lists.ozlabs.org; Dong Wei <Dong.Wei@arm.com>; David
> Thompson <dthompson@mellanox.com>
> Subject: RE: MCTP protocol support in OpenBMC?
>  
> Thanks Emily. Based on feedback from others, we can decide whether we
> should form a WG or should use alternate mechanism.
>  
> Supreeth
>  
> From: Emily Shaffer <emilyshaffer@google.com> 
> Sent: Wednesday, November 14, 2018 1:02 PM
> To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
> Cc: Jeremy Kerr <jk@ozlabs.org>; David Thompson <
> dthompson@mellanox.com>; openbmc@lists.ozlabs.org; Dong Wei <
> Dong.Wei@arm.com>
> Subject: Re: MCTP protocol support in OpenBMC?
>  
> Google is interested in investigating MCTP as well. I'd love to join
> the wg.
>  
> Emily
>  
> On Wed, Nov 14, 2018 at 8:14 AM Supreeth Venkatesh <
> Supreeth.Venkatesh@arm.com> wrote:
> > David/Jeremy,
> > 
> > We (@ arm) are also interested in contributing MCTP to OpenBMC.
> > We are in the process of getting CLA signed.
> > We have the same concern regarding duplicating work.
> > We would like to collaborate with OpenBMC folks  who are interested
> > in this topic. (maybe form a Workgroup to discuss this).
> > 
> > Thanks,
> > Supreeth
> > 
> > -----Original Message-----
> > From: openbmc <
> > openbmc-bounces+supreeth.venkatesh=arm.com@lists.ozlabs.org> On
> > Behalf Of Jeremy Kerr
> > Sent: Wednesday, November 14, 2018 8:00 AM
> > To: David Thompson <dthompson@mellanox.com>; 
> > openbmc@lists.ozlabs.org
> > Subject: Re: MCTP protocol support in OpenBMC?
> > 
> > Hi David and Rick,
> > 
> > > Does OpenBMC currently have any support for MCTP protocol layer,
> > or is
> > > there a plan to deliver something like this in the future?  I'd
> > be
> > > very interested to hear about any future plans related to MCTP
> > stack.
> > 
> > Us too! I'm interested in looking at MCTP, and am in the middle of
> > doing a little prototyping with our host firmware stack.
> > 
> > I'd also like to avoid duplicating work though, have you (or
> > others) made progress on this since this initial email? I know
> > there was a presentation on MCTP at the recent hackathon, but I'm
> > not sure if any solid plans came from that.
> > 
> > If not, I'd be happy to sketch out an architecture for this...
> > 
> > Cheers,
> > 
> > 
> > Jeremy
> > IMPORTANT NOTICE: The contents of this email and any attachments
> > are confidential and may also be privileged. If you are not the
> > intended recipient, please notify the sender immediately and do not
> > disclose the contents to any other person, use it for any purpose,
> > or store or copy the information in any medium. Thank you.
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose
> the contents to any other person, use it for any purpose, or store or
> copy the information in any medium. Thank you.
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Słowackiego 173 | 80-298 Gdańsk | Sąd Rejonowy Gdańsk Północ |
> VII Wydział Gospodarczy Krajowego Rejestru Sądowego - KRS 101882 |
> NIP 957-07-52-316 | Kapitał zakładowy 200.000 PLN.
> Ta wiadomość wraz z załącznikami jest przeznaczona dla określonego
> adresata i może zawierać informacje poufne. W razie przypadkowego
> otrzymania tej wiadomości, prosimy o powiadomienie nadawcy oraz
> trwałe jej usunięcie; jakiekolwiek przeglądanie lub rozpowszechnianie
> jest zabronione.
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). If you are not the
> intended recipient, please contact the sender and delete all copies;
> any review or distribution by others is strictly prohibited.
