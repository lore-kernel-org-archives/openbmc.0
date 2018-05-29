Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::234; helo=mail-vk0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TJBC3Oz7"; 
 dkim-atps=neutral
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com
 [IPv6:2607:f8b0:400c:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wJdQ6dBpzDrJF
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 02:11:54 +1000 (AEST)
Received: by mail-vk0-x234.google.com with SMTP id s63-v6so7361997vkh.9
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JMsBsUvhYxjnOat+c1uqlGvLGlVaHvaVn5H4Sxu7qck=;
 b=TJBC3Oz7tAwOHRr25dFITmNyHoU8MeeJnHUqSi/tRaHqWGcDChMKqWoGPyW040g4FY
 0FKZ9OX9GlrrY6Yh8eMlBdiaKnx54sS19DBinZ1B+01U/TkKFErEx7DbaXaERubNf5k+
 4QQ5GHOsm6CWKYmu10ppQwnvyyiWxO6FnnIIHhZRVqN+c/hetPI553l5sn0n/5IhTr9j
 oDHhchI8AleSPH74jUqtwUkZfS6kuUCYmTGrO2w81bc+3PhT7vJ+ZXc7cC/OWn01i+An
 Py3LmQj7ZQd4MaaTEWl8eK91IuI5YWyMGPvAz9X65HiKxa7EhK/DV5L3UTvz1zLG3cEE
 CfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JMsBsUvhYxjnOat+c1uqlGvLGlVaHvaVn5H4Sxu7qck=;
 b=s3k+0XCxRH7Cc+zZ9JWfam0v6ykY7B4yuo6q+ubYOPBBQO9hIVe0/T89219ywaL6sV
 LCX/0urh2TZhB8dqyGV53ZDUK59m9qm/slWbR5/GEfzcx8lBeafogxI9qX/LlU5AKcsO
 uvJXybwAdxb55A1IG2SevIcTd3K0kwjH0KzC4srrEcSshh1D/vzcF4/Pfa7b9rWfI6WI
 IHj0K7gF83UubRv92xGPFqw5aO6939m+6yeTgFN8p1vRnz0kyGpbgeb7lwJ8ngx/jaCm
 7ZsOaNwjTKIRIwlDtZ5HpojfkT/XaY8YHx9/4arkgPnQeE4NIQljTnJrvlFAbnlhxEwo
 qCcQ==
X-Gm-Message-State: ALKqPweKd3lrlpkYfraU/QofGdvmKZzGuRCKv8JTSV0H1/M2+ua+H3De
 XY5YuMyq2fvoTYQUmfCYxmLWyAlFk6DyZzPxF6bMEw==
X-Google-Smtp-Source: ADUXVKLnKWhyKsBbf9WOHc5h8vOdGSsacI6tgPWo14uXmMKQiJtmTkthhIwfKIsSU982uEvaSf0rP+DqkAcjyNj6/Xs=
X-Received: by 2002:a1f:e483:: with SMTP id
 b125-v6mr10330931vkh.149.1527610311716; 
 Tue, 29 May 2018 09:11:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:57c6:0:0:0:0:0 with HTTP; Tue, 29 May 2018 09:11:31
 -0700 (PDT)
In-Reply-To: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
References: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 29 May 2018 09:11:31 -0700
Message-ID: <CAO=notx8OwkJrKf6LhhDZ=_-96e+C0y=REtFEPLfDbdWxLDQSw@mail.gmail.com>
Subject: Re: Gerrit +1 policy
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 29 May 2018 16:11:56 -0000

+2!

On Tue, May 29, 2018 at 5:53 AM, Joel Stanley <joel@jms.id.au> wrote:
> I get frustrated by Gerrit removing +1s from patches when I make a
> small change to the commit message.
>
> This is a configurable option in Gerrit:
>
> https://gerrit-review.googlesource.com/Documentation/config-labels.html#label_copyAllScoresIfNoCodeChange
>
> I would like to propose we change this setting to true.
>
> The downside is someone could radically change the content of their
> commit message that you've +1'd. However the maintainer still gets a
> chance to pull someone up on this if they think someone has pulled a
> swift one.
>
> If there are some repositories that would like to maintain the status
> quo, this could be done at the top level, so that all repositories
> inherit the new default, but would allow for individual projects to
> override the setting if they desired.
>
> Cheers,
>
> Joel
