Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::22d; helo=mail-yw0-x22d.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ej3TK/2/"; 
 dkim-atps=neutral
Received: from mail-yw0-x22d.google.com (mail-yw0-x22d.google.com
 [IPv6:2607:f8b0:4002:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410n796tBGzF1xV
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 08:49:41 +1000 (AEST)
Received: by mail-yw0-x22d.google.com with SMTP id v190-v6so1285432ywa.12
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jun 2018 15:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BAZe70JlrI0+/S4YtjfY6vEUTpp2PZqL1th3PnQO/P0=;
 b=Ej3TK/2/jEsjDJqBSs6L8dXxq6EnbOynp+2sP4sR9OcVT4hEdOhpBJDjvMyrbWj7GX
 xAb0IPONeXJdgcvBtLnndBF8dX1SPyGVIXcLtxGPGWCp6fYtjDHdLDtBDndNMYN12Emr
 UzAxZ27vzvM2F9pAI4sge0PSSpsjsJL7HEop4Nooz1aKL4JSpxii/BpdnTzjd5C/cjqv
 TmTDqpg2x0+meT5ICnjZWX/pwDLCTxYhYzo9+A5ZmJLOD8q3xnsU3ByzVZJZhKoUMBD2
 YNGKTV8aou9bdiq9/b2P/AWZ8Q4AjrRqxPMSUSc7ZiCjP8LqLhtDihEb/ngeJfaZz+B/
 9wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BAZe70JlrI0+/S4YtjfY6vEUTpp2PZqL1th3PnQO/P0=;
 b=PKDuX+IUtxW8eKPwK5xFbO7WbdJz9XmDxVX0HcpeaxLBHT6gsZDuBPPNYABhv0k1pC
 rMgXcJilcMizHdO0SeuW/aRGRlG9I0r4zOm83kgbdY15hlQPiMkawc7I0qCJAPM7lT8U
 sGMG0Ptmt63qq8GaWqVY2sXj54g3HienwkIediRVG11xScRQfKXOGD/PpQw/7OJQD1kW
 yfVwCNqjVUwBv+rMQ+ahcVecifw2ESRB8aeDaNNjcMzA2Ad1Ic5Db+c+TjBVuh5Uj1mQ
 NhurxAJEOrh9Mq/DVjbS4ny2nNRsVo/QImO93mNWkLa51a32Rdi5xTwOOkrttgTc1RFB
 /7tw==
X-Gm-Message-State: APt69E1sd++Rlx5E/i9zh9ZkyCP7szQn26NyZogY3W89dKnmh9o/jmCM
 +2wSmnsI4tFhNgHNcqGOniShhPFAj7PIIZm93BY=
X-Google-Smtp-Source: ADUXVKK7p3Ix0o7vA+4fj/oBOIx8szSJVAmu5yO413u/JwXNz6ZJuaX0judRK9mkpMDwyQ/QHkSi7219Zo5RyyYXSz4=
X-Received: by 2002:a0d:c447:: with SMTP id
 g68-v6mr291244ywd.205.1528238979007; 
 Tue, 05 Jun 2018 15:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:2d4b:0:0:0:0:0 with HTTP;
 Tue, 5 Jun 2018 15:48:58 -0700 (PDT)
In-Reply-To: <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
References: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
 <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
From: James Mihm <james.mihm@gmail.com>
Date: Tue, 5 Jun 2018 15:48:58 -0700
Message-ID: <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
Subject: Re: Hackathon - Sept 18th - 20th, 2018
To: Joel Stanley <joel@jms.id.au>
Cc: "Mihm, James" <james.mihm@intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2018 22:49:42 -0000

Thank you Joel!

This is meant to be a community-driven event. Please share your ideas
for topics of discussion or work sessions.

Here are some additional ideas I'd like to share and get community input on=
.

Opening
    state of the project
    working group updates
    roadmaps

Onboarding (?)

Developer Knowledge Sharing (training?)
     Dbus - how to use bindings and libraries, pros & cons,
alternatives, sensor and event database

Security
    Static analysis tools (intro/use?), threat analysis, assets, mitigation=
s,
    TPMs and the BMC, project cerberus and beyond
    Threat landscape (freight train to hell and back!)

Penetration Testing
    Tools; burpsuite, lynis, cminer, appscan, postman,...

Redfish

Validation
    Test cases, tools, and their usage

Community Networking after 5pm
     Pub-n-grub
     Brainstorming sessions

Closing
     Next steps, calls to action

James.

On Mon, Jun 4, 2018 at 10:27 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi James,
>
> On 1 June 2018 at 08:53, Mihm, James <james.mihm@intel.com> wrote:
>> Event:  OpenBMC Hackathon hosted by Intel
>>
>> Date:  September 18th =E2=80=93 20th, 2018
>
> Thanks for organising this.
>
> To everyone: Is there any interest in discussing kernel and u-boot
> related topics with me at this workshop?
>
> Cheers,
>
> Joel
