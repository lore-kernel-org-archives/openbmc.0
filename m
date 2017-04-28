Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDbm03P75zDqCv
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:27:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oOB0stqj"; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id u70so24481854ywe.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6urQCrl2YI4lVzSyfF0jFMubO4bPyZjyUgTiLFAe7Yg=;
 b=oOB0stqjbEPS7eIUc8w5WerGmRg0NL7zw3RywNcR/XMj4vLhsDD0CC8bJK0RdAZjZE
 CRt4cq0tRD+eaBod8o0+j7j2p31ez05foDBx/Gk2pU6iZbeIej+tjlBTJ1QADHZo6VQN
 n+y7boSTU8IBp9fIWFkpDA8RQBaO/YP340Z9SnDbVpqvWLQcaQ6SyVAJVQTE+mUM0UI8
 OcHcf3k1qB30ktcX5mrmGRWEyeRqeCJf8BLIuMVGpsUb+BFoDPp83rBmwtsS6WWohNd2
 wcvBTu8k0knz9v+fKGXv40ij/UcmEqZC1PfDz2lFDAQxGNBMLC2q8cO8theJFi/ktZTM
 3zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6urQCrl2YI4lVzSyfF0jFMubO4bPyZjyUgTiLFAe7Yg=;
 b=ITjMEfQSzl8C2Ys08sK22z2d2b97mhvTlms2DHmADG6yqKEUZC3kZ85ssL8z3RWDUH
 Ok+gy/uypuqug6tDYLW3VTTn9zIACC/xtdUi45NbfISng4PJ4ee4Omj7stpb4dWiXMej
 ZVGzP7tT8RDm060hndUnl/lRn6svMkU8UykfTzXwZ4Z2+rJ3TAM8KVvboSVguyPLh9hg
 JNLlEBoziyoe4mc/18H1IbB0UZOVrGk0YAuxF9xnCfuvcgGQbJJMlLUb+KDK4clBJn9e
 aA0XVhDIsfVlKgur0C6MAzoO6eO2SKHkTORsglMqY3S21/m8Y9xZYRvpr+80RTZboIwA
 aegQ==
X-Gm-Message-State: AN3rC/55EBUDE1Aol//6Fd4pDkHcatYz6GCuBMMZQNdm2OVr6Qe3Mb73
 kMJaoBwPehK7uoKq1WN4T+v+82U0qA==
X-Received: by 10.129.76.21 with SMTP id z21mr7367247ywa.43.1493342862081;
 Thu, 27 Apr 2017 18:27:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 18:27:21 -0700 (PDT)
In-Reply-To: <CAPLgG=kUDdPgcLnp5fV+qjJHhONoD4DT3bvuaVXVsQO1W6FrZQ@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
 <CAPLgG=kUDdPgcLnp5fV+qjJHhONoD4DT3bvuaVXVsQO1W6FrZQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:57:21 +0930
X-Google-Sender-Auth: DAT0zNFPMIu4rDhILFwH91FEb5Q
Message-ID: <CACPK8XdhzJHVSSir8Z3BxxumkhKga2Od29qWgT2sHMO47TZnwg@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Rick Altherr <raltherr@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
 Edward James <eajames@us.ibm.com>, Xo Wang <xow@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Apr 2017 01:27:45 -0000

On Fri, Apr 28, 2017 at 3:44 AM, Rick Altherr <raltherr@google.com> wrote:
>
>
> On Thu, Apr 27, 2017 at 12:33 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
>> > I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which
>> > has a
>> > defconfig for ast2400.  If you have one for ast2500, please upload a new
>> > patch set to that change.
>>
>> I have defconfigs in the tree that are ready to go. I will upload them
>> to Gerrit when I get the chance.
>>
>
> I've been holding off on testing some RNG changes because it depends on
> 4.10.  Can you please upload these defconfigs so I can build a full 4.10
> image more easily?

Sure. I will push the 4.10 tree today, and you can use the defconfigs
from there.

Cheers,

Joel
