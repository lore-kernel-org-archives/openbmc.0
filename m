Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t57ty1scPzDvTT
 for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2016 03:07:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=cLbPshRV; 
 dkim-atps=neutral
Received: by mail-ua0-x235.google.com with SMTP id 20so42248244uak.0
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=K+aCQJfz5aM1MAsQngF14MDguK3q6IA3gJafGIa0+EI=;
 b=cLbPshRVXn+J2LxqFVnskquWw/jveG2r1MR1rb1+hSg8D2w8X9jWpfW3wdCWq2pOZT
 t8KuMQeaUMkunVEuo90WdA0Hwpp//j2ln2srnyAjgtAzPByKeo9rBEeWFr24Qh8N9ofN
 1p5ZAcRLZlvQlF9IF1F5EYc5flWYUJ8eZglbBzPY7k/3NhhBpdRpeaJ8norns+6lXiou
 DRQwitDSN3R4R20yPaPlL9VN2o38lHn5tbQIByPVIkc28J1tfbze3ky8yqhOgB+oVRkU
 Itcbj0K+tOZSo3Pbmu7ABEFezeoA29BP8ZTshXgFxRqO8b++1b1YGZpMHTFut2r1A7kU
 KIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=K+aCQJfz5aM1MAsQngF14MDguK3q6IA3gJafGIa0+EI=;
 b=ZCTFrIBo4vXE/nzAyTtKKnoQkmuHKGdWqPg9xEklulDZk3C8J59BhxtmxM+tjiLne5
 dmhbtzkJBh2a5ZglOlXrffQyRHxbNJc1LUqXE1OMfx6MtxiIo/mAJ9WgWynjWNoMlVZq
 +avfxTvdb6HrGeoM9bJG4TkcJZw/dYcWhrO1R0DJeF2J01Y6kAY69zQZ906lcS/YYZ6K
 uJGpuXx2w5nICcMhHQeDEHi4Okh030pSAJfzuGtIgf9/qA7MDUAuiqUqIouP8p2FybKO
 +PBhKYnUDEUJeSNqpMUE1xtQw+sLqFJyyDPlWZHxlSIp6OxtJd7cVWAAE91aH24X/Vke
 5hkQ==
X-Gm-Message-State: ABUngvcDncGdYTOWg1as4c3T811fgPiRgwscD+vJOqc/caujafC9GHLJRNwJX3AH6H47pTt7Po49kBXKCRt0ePk0
X-Received: by 10.176.16.2 with SMTP id f2mr1984233uab.49.1477670839092; Fri,
 28 Oct 2016 09:07:19 -0700 (PDT)
MIME-Version: 1.0
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Oct 2016 16:07:08 +0000
Message-ID: <CAFd5g44R3dX3LrNrK9v48wqDW1YfuA1psjZso749=eRMAEZO1A@mail.gmail.com>
Subject: IBM gtest presentation
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045e315875de50053fef0d2b
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
X-List-Received-Date: Fri, 28 Oct 2016 16:07:23 -0000

--f403045e315875de50053fef0d2b
Content-Type: text/plain; charset=UTF-8

Hangout link: https://hangouts.google.com/hangouts/_/google.com/ibm-gtest

--f403045e315875de50053fef0d2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hangout link:=C2=A0<a href=3D"https://hangouts.google.com/=
hangouts/_/google.com/ibm-gtest">https://hangouts.google.com/hangouts/_/goo=
gle.com/ibm-gtest</a></div>

--f403045e315875de50053fef0d2b--
