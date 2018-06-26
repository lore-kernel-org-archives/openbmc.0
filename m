Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22a; helo=mail-vk0-x22a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Gpr5eotU"; 
 dkim-atps=neutral
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FX3W18PjzF1Gj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 02:45:42 +1000 (AEST)
Received: by mail-vk0-x22a.google.com with SMTP id o71-v6so10433300vke.7
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kqaREb+5Q1CHIBn10fk5wdeGBWYUOLDDGfPkT+q4DI0=;
 b=Gpr5eotUKQxexMINBPCOnYOQwMv0aG/H0/4DncYGuQtH53EzgYi4x5nu8ILKqwg2Kn
 jgfPmavZQgzzRsPmiG8FrXzZaPOG2kHwqqZVlD7rgKcAHvlSoC1T8kGlwOjI3ycP8XSr
 FA94kuAwVJRQAGIo1mFn5iwCtlvqoWGwy5QTPaGXUTVDLJMzoj7j18lI8hTu4Bk5X3q7
 9HsTxOrwI5kbfwnGhvTQmI8HGGqEnKlpOZYFMN80ju9JAh5/tNYxqgKeFUqpjmcBl1Dk
 stcy2EwoaCypGhroov+h9b+mGfj3XpfVEri6v+1QmQH3Z/0HiQG24K7CkrGJRetZQtG7
 moYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kqaREb+5Q1CHIBn10fk5wdeGBWYUOLDDGfPkT+q4DI0=;
 b=ZKwWnF4DOPna3/v4SZrSx8RWseXEf2mu7oN0cLilkdXCInUfWwuVEfiEO2wpK4VbU4
 ihOoaBtFRTx5A+e1xOHlOKTG9+cWR3heW8FCH13AtH+nyai3+uqpa4hB7wzf0y9kSbCF
 QDj+wcHQ3JvfZhx371DBoQadTn3x3oslJjCfiICfG/rQi2sfFiugA/nIHLf6U+PvzxQO
 NveQRxH/hm3obi2kLEYzaSAuPjwZlwFxSpFkukyNBcQWR2r4sCQGbLx+13NvDVBElnEm
 iSJrYWlLwpTy0Ib7v1ctHRcJD3bT9TYx31TAoGxlskhBeXhhR8HGBL2FVgfP8tdvYb+7
 MEXA==
X-Gm-Message-State: APt69E1dWqufzoGUuH8PFedS3P52JrDw12xSFX6ltYURjwSEFbXZcRmy
 ANwN3oPzrCt2pQt2hO1rkxIYpqraEZeHoa9J5Y148A==
X-Google-Smtp-Source: AAOMgpe8sTphDZqjrH5fkpaR0qGvTPz65/CD58wRvzn3efxWLOwDzMfHzJ6ol99uyOPaQT8ynSOe++68Pomj50nTE30=
X-Received: by 2002:a1f:66c6:: with SMTP id
 a189-v6mr1453107vkc.73.1530031539483; 
 Tue, 26 Jun 2018 09:45:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 09:45:18
 -0700 (PDT)
In-Reply-To: <CAG5OiwjErYOg6g=-L+N0V0d-je9jsDMedZdW40Ej-9vamkNA8A@mail.gmail.com>
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
 <OF271EFC9C.4E484BDD-ON002582B7.0055123F-652582B7.0055A643@notes.na.collabserv.com>
 <CAO=notwRGurPdnvSX_A+DVNudS8V0aSRwsiSqpECTes4FjFMUQ@mail.gmail.com>
 <CAG5OiwjErYOg6g=-L+N0V0d-je9jsDMedZdW40Ej-9vamkNA8A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 26 Jun 2018 09:45:18 -0700
Message-ID: <CAO=notzQFR-otQtkcsHpUZ_y7_Vt+PgJMdGHfMQs2GxsTxC9Pg@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: Kurt Taylor <kurt.r.taylor@gmail.com>
Cc: George Keishing <gkeishin@in.ibm.com>, Ali Larijani <alirhas@microsoft.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 16:45:44 -0000

On Tue, Jun 26, 2018 at 9:37 AM, Kurt Taylor <kurt.r.taylor@gmail.com> wrote:
> On Mon, Jun 25, 2018 at 2:06 PM, Patrick Venture <venture@google.com> wrote:
>>
>> So, lots of voting, I heard the first one is tomorrow.  Tomorrow at 2pm?
>
>
> No, these were proposed times - the idea was to pick one that worked best
> for you.

Thanks Kurt -- that's what I thought, but for whatever reason I was
told it was today (then tomorrow).

All three times work for me.

>
>>
>>
>> Patrick
>>
>
> Kurt Taylor (krtaylor)
