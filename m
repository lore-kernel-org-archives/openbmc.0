Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbTf40V1fzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 16:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ytggFRJV; 
 dkim-atps=neutral
Received: by mail-qk0-x22e.google.com with SMTP id a186so135503548qkf.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=pt7HTWV91Z65E9SbUYMQ5pnYV3NZuoUN427dMaUExiY=;
 b=ytggFRJVLhCrokMUHcSwmli5qL0Vxvh0eYmF23tyHpVa1BoQi3eqwwZxzxZDSH6v8l
 AZi0haPDfHV6gWo5RuQ+xhzHu/jXKuTYjn2Tv/0NosLQKw02lk1UQcLTn9wjbRoUL5/g
 uWxKhvZb6vpD4rS27yDKkbG07pobTB0ZCaOVFrQwgAibVTGpPYobntgS2JpO4/pbXTC4
 w7qpVgzNiPy8EyVCUz9oDMJTa1NOMoT+BwbRvqQFUSqxfXSJ0o0IYll/gM91IVhXBrPk
 2RItkH6gFcOD8uMUWQgeYhEYSvW37KlBmlSLr9nJ0ZD3eCHjNW+PZ3vAEaCkFfhi8OGd
 IjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc:content-transfer-encoding;
 bh=pt7HTWV91Z65E9SbUYMQ5pnYV3NZuoUN427dMaUExiY=;
 b=JS+maB+KRv8VfTtr/O7LkooMQqMLH7Obylej5hL3qaphGFvCgGtuSWElacCst0BEIZ
 zcbjZqB5o7GmCUd1z7LKhdton7RkSnnrEXW4XCFiHEnOk6wJ84AJ+njGUu0BpXq6uGKR
 60Rq93ffFUaIaz505pwjdCNNrXqj0R4jE1IXCKPf8PKLQkChyi9QaG0dE1701SePkTRV
 WpN9rTbYK+qFXTxLJhyu1mPlDeOp1Te/r51pdA7kfaxA/+RBvBmx9m80v2PHGkzZQgjg
 aiBHqXBYN+v/XiKkU8upR21GtQcsLSOfWPEgsWM1OnMckOD4YnClLbSTE9eRJvBUTBEi
 fxyA==
X-Gm-Message-State: ALyK8tICqZyyR/dQqrfJmQguvMd9p88ND5pzO8wynmPA0PqggK7I52yPk+mskDwhCm+qHlbyydxhGLgaiXXU9w==
X-Received: by 10.55.149.3 with SMTP id x3mr2844428qkd.140.1466751417634; Thu,
 23 Jun 2016 23:56:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 23:56:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 16:26:38 +0930
X-Google-Sender-Auth: jdkxMQIzT5hP9HshRqeqaRm8Akk
Message-ID: <CACPK8XfhsgwsrbY+VKWk+SF0Cogr3j1f+X5r4P5uoWsgMJ0TqA@mail.gmail.com>
Subject: Keeping tagged builds
To: Chris Smart <chris@distroguy.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 06:57:00 -0000

Hi Chris,

On Thu, Jun 23, 2016 at 5:24 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 06/23/2016 09:24 AM, Joel Stanley wrote:
>> On Tue, Jun 21, 2016 at 12:46 AM, Patrick Williams <patrick@stwcx.xyz> w=
rote:
>>> I have just tagged v1.0 and uploaded it to Github.  This is meant as th=
e
>>> release to support Barreleye in production capacity.  Thank you to
>>> everyone that contributed over the last year to get us to this point an=
d
>>> congrats on this major milestone!
>>
>> Thanks Patrick. It's rewarding to know our work has made it into a produ=
ct.
>
> It would be great to keep images of this version available. Would that be
> possible on https://openpower.xyz/ ?

Do you have any suggestions for how to do this programmaticly? Can we
get jenkins to realise that it's tagged and retain it?

Or should we set up a separate build job that triggers off tags?

Cheers,

Joel
