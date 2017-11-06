Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::232; helo=mail-lf0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAZmQTkQ"; 
 dkim-atps=neutral
Received: from mail-lf0-x232.google.com (mail-lf0-x232.google.com
 [IPv6:2a00:1450:4010:c07::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yW7kJ6Y5mzDrK1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 10:17:12 +1100 (AEDT)
Received: by mail-lf0-x232.google.com with SMTP id 75so12389683lfx.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 15:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AooO3i6XeAsNBX2XSRrYtye7yOFt1UHGhAr9UAzaFV0=;
 b=GAZmQTkQYM+sIXGYhfMCO8IkbRpOEl7G8XbSUKNCRMNxkhF2znMaiXRzVMWf7v0weX
 SUVMGuKO46LGxwabiW6ZVxS5IPeaNcsUHzuhFMl04IsGAUra/IsELwd5G0ST0Iv9HIBS
 Ey4RgjrpOmeGng4nCUA7puh4b1DyDNVeAtM2hVWXxTkHXmn7HDG7vGHYLPtjqL0hTi4L
 Gw7CvpTTnoCX3KkHatqu9Hd7QMMVP2pxDoX+AtazdXe7xeghHbBfX5oyyAWtMtRcPy89
 DSbY88AEaFLm7OmJDQNBxw6kwfOrUN2eh8swO0GkggJP1hjIaryK+tLfM4NxWz29s8NB
 n9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AooO3i6XeAsNBX2XSRrYtye7yOFt1UHGhAr9UAzaFV0=;
 b=a1dMKFZ+TqMf+mGraPI2oRhflPzEjOK+6MKHL31Ao9Izq0Qd+n3F/hniuiAzFaR6Ig
 MyJyMoFtUVXb4i5xWsGrsp9oG+7uqp5tllOcOBs0GFB3hr6X3zmqsNzLS99T+Vn6v3WZ
 3hcB7mpLWdXfjGWEGtScQZlBvgu2PTviaActFJ+cQvbO8GNphTaoHPxYdjCOH5MRftZJ
 BrRCRennWQa2AbOM2Pvmlvfyk4CLa9PS057xq0f1dalJZbjUdruwoKeiwUrSq02tIUV/
 yBA1wRQkrtKFEa1Z+h9c5Fck6VdFZ44svpgCfxPmrOfaRdPdOpwWx0szZtmZr8IcKF3e
 WoEA==
X-Gm-Message-State: AMCzsaWM7K20OFVEBDV52g6AqyqXbH92XQuV1+JyQOuYI5xHTpwAmmmZ
 MjZfzkNbzRC9+JTVX0856nKFlUC4IbQyQAvn9u5Uvg==
X-Google-Smtp-Source: ABhQp+SD/sXquCrA+CYM138sBnwG2mjDKVyEiiBKLtiuOuT4uNk70aLiNcgINjFtOmPpghx1IlzBOQWMpOaOKeHeWrw=
X-Received: by 10.25.83.144 with SMTP id h16mr5893767lfl.123.1510010228470;
 Mon, 06 Nov 2017 15:17:08 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.71 with HTTP; Mon, 6 Nov 2017 15:16:48 -0800 (PST)
In-Reply-To: <20171106031323.21519-1-sam@mendozajonas.com>
References: <20171106031323.21519-1-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Nov 2017 09:46:48 +1030
X-Google-Sender-Auth: HLERKxZPgjwqfmHWLUWpFKk49l0
Message-ID: <CACPK8Xc+85o8mwiWJ5Cyt-zjqBqZk7=m43a3hhK8oi1m_O1rLQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve NCSI driver logging
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Nov 2017 23:17:13 -0000

On Mon, Nov 6, 2017 at 1:43 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> The NCSI driver has next to no logging at all, with some of the only useful
> logs actually coming from the ftgmac100 driver as link up/down messages.
>
> Add a great deal more logging to the NCSI driver, tracking channel state and
> selection, link events, and so on. Patch 1 has no functional changes, and
> Patch 2 sends a Get-Parameters command during configuration to sanity check the
> current channel.
>
> A form of this will go upstream (the log levels probably need some tweaking),
> but this iteration is being sent to OpenBMC to assist people currently
> debugging a few network issues in the ftgmac100/NCSI/Broadcom area.

Do you want this applied to the tree?

I don't see a reason not to post it upstream (independently of me
applying it) as is.

Cheers,

Joel
