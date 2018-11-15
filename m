Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CGI3lHBb"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wj6964fmzF3dD
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 00:35:13 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id t5so18069318otk.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 05:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1sF0HypY6OviqwgjfTplpCbySYmKzDkoB9+/fL85so=;
 b=CGI3lHBb9gmofAaTE449m3qeb1H8j7kJF/TzotSvroR/lC++IHR/FNEIJmFndLdgvh
 dJC6RXuFrMiYzFmLy0Rz9XZQNJHfU6hFKuERX4dUJgnOqhcpvcPn1CkbMOHhmSzHnKGl
 G3jqvyll8bXsc/U9Qr9vUMpoA0I4Ulri5o+sQ8odcpBQno35mgYV9OCtNARnzhE2maFT
 8I5X84Z4i+DZU8Jxrri2J/c82mkd7SdXT8GJaiDCvPhnl2LY0RGcwd1SRJ4u4Pf4vsI/
 xzr/0bwEul/ghPGQicfypR/61DYwAJ6DH+oWRYq5y+o0gJ+obIvi2pBGRmEpgYOrt96K
 Pdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1sF0HypY6OviqwgjfTplpCbySYmKzDkoB9+/fL85so=;
 b=RReAMmcMN7WBKziUeSQJEJwT5eDrojONOK1P5+moiSetDsw8TS22FigBD+fJA7HYPM
 5eaoBYVfXuwdO2hOI6opMlcxFQRKSO96Nu4FQzCuyQXHX5LkdyLcybRQXxI70KkYbQq8
 +/v6sXh7wwbpZZTX3zsO7Ccpr892t/e+cFz/T0R/HCUY6c3MLtWAHjCruW7M/KXQsLdd
 JSRzLDprXLR0SGntwCgBpegfEsTK+bRXh6JLknXOqaDDJtWtTUEkTnjKViGrO4e+yk/7
 67syZarkEt/TzNfZRPWWiTFR2sfmfsYW506kkkeztbxHxl9XpRyboY9ZvkRzwaM8ICZY
 Dd/w==
X-Gm-Message-State: AGRZ1gI2rGwoRjOWIDrg4olTnoa9yovGyW9hLrZVA0iqY2u4X27R9nxz
 9Xlwl4XCqsca2izHccR91I1MVM3QBuWSP4g4vxo=
X-Google-Smtp-Source: AJdET5e2qO7+dqBHAHZhi4aeXSgVZfz4VzDKsHUG1u5VBZ0BcQqjOLJdXUZcoiWyoKj+kdZRR964Qln91RfGSvVW2Xg=
X-Received: by 2002:a9d:74c3:: with SMTP id a3mr3863501otl.107.1542288911548; 
 Thu, 15 Nov 2018 05:35:11 -0800 (PST)
MIME-Version: 1.0
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
 <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
In-Reply-To: <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 15 Nov 2018 07:34:55 -0600
Message-ID: <CALLMt=qZfH8h8wTjk_p=JwYuGKDG4YyhdjMP=_K09hPUAPNJWw@mail.gmail.com>
Subject: Re: MCTP protocol support in OpenBMC?
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Supreeth.Venkatesh@arm.com, dthompson@mellanox.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, emilyshaffer@google.com,
 Dong.Wei@arm.com
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
X-List-Received-Date: Thu, 15 Nov 2018 13:35:14 -0000

On Wed, Nov 14, 2018 at 7:44 PM Jeremy Kerr <jk@ozlabs.org> wrote:

>
> With that in mind, and since a few folks have expressed interest, I'll
> share some of my initial sketches to this list soon. I'll be sure to
> include MCTP in the subject to make things findable.

Please also remember that with new functions, we'd like to have
https://github.com/openbmc/docs/blob/master/designs/design-template.md
filled out at some point fairly early in the process. The gerrit review of that
is where some discussion can also occur. The mailing list for early design
points is great too.

Thanks Jeremy!

>
> Cheers,
>
>
> Jeremy
