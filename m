Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::236; helo=mail-yw0-x236.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QIER3H6H"; 
 dkim-atps=neutral
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418y144fyyzF0WP
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 15:57:44 +1000 (AEST)
Received: by mail-yw0-x236.google.com with SMTP id t184-v6so1908944ywg.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/3fWDawDU7LAyNVKyNYH1p4zPQp/FeSVVmmGosqVuM=;
 b=QIER3H6Hi5G8fgvFPOWUD+/pTsWW8c0348Zh9Y/mzdX3y64rzjRIAqnBWT4k3pu3pe
 SfSqvvw8d8CejthFhFbK6rlYYDHzeaL4SJIsf00/iC1ZotjU5a7BUTehx7Q3oe+A41bV
 33/40zeTQEj61dut/NLG5bE2xSIX3qhy2tBPluLCpfyA2kCQ/T/GQ5TZsB/dYYnChlFi
 5obXBNt3gx2x6kgIgkfvRN/rGEdPHrbH7zIiriz/peZLyChwbVh5h/l97e0Uc2vqv1W2
 inEiDOaaDmxJLorB4OmHyDl/+RE9QYGbGVgJRS0KLDDQgmM5pFrlE4+xfvXtkIF9UIS+
 haKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/3fWDawDU7LAyNVKyNYH1p4zPQp/FeSVVmmGosqVuM=;
 b=kGa1ST2d5iwnmZ0CuWortfSvum2SpbNnmzzzVSOKq6QuCwmw06HCXfSezLo5Z7albB
 1nSopi0eSaEqhVj4lpfLLL5hJ98Tug9vEJMmZdEy+es0hBRRcWrnmdy5mI+pMWo7ZmXg
 gx4fDF53fBQDOPynHPS5ti/Sv2U9liA8PoEc2rQSGTFDXgq6xFB7HIl1lt8GxUbqJU0B
 nJqAr4M6KzuavdQ3awDifaF5Ra7eeKfzx6GhGYy0ncN1c2FRz9QW6wdE+M5oSxGoHxT8
 j/eKoO/QbZuVTdhL4zW05807W8tNmrSISWQj0KmPSXIaWx9IOikxmwRaRT9xH3sQ0ei0
 s3Kw==
X-Gm-Message-State: APt69E24qROL+YvQ9pfIBIsYaRVgHk8UAgdZmTNqoqgtYce9vq8dwtml
 9UqgKHbDOUjNfyItITnLuM8B6qgzKyyzxWtPS9OIdA==
X-Google-Smtp-Source: ADUXVKIWfM9qnRL0JoOyfehJpr8MZhe5QTDeDT5hwUcpMOZ652o6DWcyGAW4QSjURKfgeDC/ZiMIT0j/1ttJiopiT8A=
X-Received: by 2002:a0d:c447:: with SMTP id
 g68-v6mr7717793ywd.205.1529387861213; 
 Mon, 18 Jun 2018 22:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ebc0ca056ef350df@google.com>
 <1529384519.3876096.1412667488.17D5361D@webmail.messagingengine.com>
In-Reply-To: <1529384519.3876096.1412667488.17D5361D@webmail.messagingengine.com>
From: James Mihm <james.mihm@gmail.com>
Date: Mon, 18 Jun 2018 22:57:05 -0700
Message-ID: <CADy_Pt2rWNu7NuTfQWfP5T+mzfVW3FCbc_8j_Ss+zOwiy68sRA@mail.gmail.com>
Subject: Re: Poll - Fall 2018 OpenBMC Hackathon
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 19 Jun 2018 05:57:45 -0000

Andrew, Great idea...just added either and neither.

James.
On Mon, Jun 18, 2018 at 10:02 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Tue, 19 Jun 2018, at 09:26, james.mihm@gmail.com wrote:
> > I've invited you to fill out the following form:
> > OpenBMC Hackathon
> >
> > To fill it out, visit:
> > https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=0&amp;w=1&amp;usp=mail_form_link
> >
> > I&#39;ve invited you to fill out a form:
> >
> > Google Forms: Create and analyze surveys.
>
> Maybe we should add 'either' and 'neither' options so people can register their interest appropriately?
>
> Cheers,
>
> Andrew
