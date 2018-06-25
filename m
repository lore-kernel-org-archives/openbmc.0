Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::232; helo=mail-vk0-x232.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S9bTp172"; 
 dkim-atps=neutral
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DzFK30jXzF1D5
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 05:07:16 +1000 (AEST)
Received: by mail-vk0-x232.google.com with SMTP id o138-v6so8523515vkd.3
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 12:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hQhqMZ+x+mzythjyejtyJ+O2cDooJENOauJd5Xd94q8=;
 b=S9bTp172SNEZsvWMtY97PHET1ImEjD9MfZOE5izyyXmZ0F1Th4uBmp8k8J/R3fgu3B
 cguztEcs4mCMptbRAs6Bh7K998avIhihbdHBhxn5B4M84GyF7Ij64FoOaPTgO575jkzH
 ejJh1zs7B2HRSxGDO0PscXR2CA74oO14VCBilZvtkdKsgC8SQD6PWhxKWCg/w1GcnKW7
 U6mZuPJ6uJeBTaUlidhUF2TOsb5pLHf8fW3uTltL4Y7QMAiAPYgB/FPjuCvmlUoLfa/D
 6qEMKXKGnVbO/470SvIsJi4zcMFHxt0aJdRDfHfVa7hOQa0u8ljqKQ9y9bGmUqbWh5Mk
 Ulew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hQhqMZ+x+mzythjyejtyJ+O2cDooJENOauJd5Xd94q8=;
 b=qQe6Xw2jHc0a43Kp93i7vdG4VHLjp2gfofjzhXfBiUauV655Bn2BeSnzYd4bam/hjM
 OjUTTfwyowC7VUoUqmbA1zzdPc37gp537O22Ao5mkFcLErA2hpMThk9drjKDWlzR4jJ6
 ayepLR0cJQxjpEWlkNNNIgpJCQO4m25PofZGPeklM2lgy4PFZFd05GWrlYoyfUVPbaNY
 R4qtZJzR0uJTuXB05PpsXQr7QUSHLN9S2nw/bFIy/Y2VyJu+WGCUMXAfXUPzCNJ9/VqR
 wRYcAN1vlEZbeNN+ZeZzHmqV7bvDlN6MA6N0lXu2AnOe0V7sNkNxM98psv820c3SRGj1
 Xh7Q==
X-Gm-Message-State: APt69E1gqyzJtu+SVYFUAtllVLFD964uPsSzzOdFOiJ6DnbJycbTyN6l
 l9AObevo3KhFHFK7ITs86m1dagRw6Rfc4bRy5x2PjQ==
X-Google-Smtp-Source: ADUXVKIso3GCLBb1phDiw42hSsQUn/ucrQM5hclpHVyR76vmpK6u2opVlmOg69ub0BM587QBlqsBnADncdzh+VvYOhs=
X-Received: by 2002:a1f:9b16:: with SMTP id
 d22-v6mr8130329vke.164.1529953632114; 
 Mon, 25 Jun 2018 12:07:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 12:06:51
 -0700 (PDT)
In-Reply-To: <OF271EFC9C.4E484BDD-ON002582B7.0055123F-652582B7.0055A643@notes.na.collabserv.com>
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
 <OF271EFC9C.4E484BDD-ON002582B7.0055123F-652582B7.0055A643@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 25 Jun 2018 12:06:51 -0700
Message-ID: <CAO=notwRGurPdnvSX_A+DVNudS8V0aSRwsiSqpECTes4FjFMUQ@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: George Keishing <gkeishin@in.ibm.com>
Cc: krtaylor <kurt.r.taylor@gmail.com>, Ali Larijani <alirhas@microsoft.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm,
 James" <james.mihm@intel.com>, 
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
X-List-Received-Date: Mon, 25 Jun 2018 19:07:18 -0000

So, lots of voting, I heard the first one is tomorrow.  Tomorrow at 2pm?

Patrick

On Mon, Jun 25, 2018 at 8:35 AM, George Keishing <gkeishin@in.ibm.com> wrote:
> Hi Kurt,
>
>         I prefer the option 2) Thursdays, 8:00am Central US (1300 UTC) time.
> Please sign me up.  Thanks
>
> George Keishing
>
>
>
>
> From:        krtaylor <kurt.r.taylor@gmail.com>
> To:        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Cc:        alirhas@microsoft.com, bradleyb@fuzziesquirrel.com,
> james.mihm@intel.com
> Date:        06/22/2018 12:38 AM
> Subject:        OpenBMC Release Planning Working Group
> Sent by:        "openbmc"
> <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
> ________________________________
>
>
>
> Hi all,
>
> The long anticipated OpenBMC Release Planning working group is now
> forming and will have its first meeting next week. I would like to keep
> the meeting small at first so that we can move quickly, but I do need
> complete representation. Please let me know if you'd like to participate
> and what day a meeting would work best for you. Those on copy should
> plan on attending or at least make sure someone is covering for your
> organization.
>
> Let me know if you have any questions.
>
> Regards, Kurt Taylor (krtaylor)
>
>
> Proposed times:
>
> 1) Tuesdays, 2:00pm Central US (1900 UTC)
>
> 2) Thursdays, 8:00am Central US (1300 UTC)
>
> 3) Thursdays, 3:00pm Central US (2000 UTC)
>
>
> Initial Agenda:
>
> 1) Agree on the release process and set an initial release date in
> November (see email from May 21)
>
> 2) Set design and freeze milestones
>
> 3) "Must" deliver items for November release
>
> 4) How to open the design and development for a needed feature
>
>
>
>
