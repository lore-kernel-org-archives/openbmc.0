Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DNyH7IPd"; 
 dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fJYW4vmKzDqMv
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 19:21:03 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id t15so1223215lfl.12
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bNYHaSlTVPq3Drxn0qYrK2OUAn+vmt+HtM1yiBWprJs=;
 b=DNyH7IPdD4K9PefvJ8XoJuQ1DMOCDJXRx/L7vN5V0dqEgopkZZcdUqcJigb4pbtIn2
 daBi5QxlkGrdaOU5anRIqls1Uc0PJZV5xFf+FpL+er/klUplByyxZGGRcj4GPJiKYCqp
 z2dCccWqDIHtLg1tJ2F9jyBLqcoZt0FzPHk0fSTTxtR9ON/0lnqoLjWs9eeOg1vYygtb
 o1l7htHXjO5vNo0NkNrltrnFC5yGIMjUBQ27trmO/Ee9qM7av6o89HC/JFSAWzhtRjm1
 TNkpXuKidmOFM8Oucm5J7i7D76B3+5vBKOv13MSejjwREtp+9sp04N+LlBXN3q5WZ/JU
 LQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bNYHaSlTVPq3Drxn0qYrK2OUAn+vmt+HtM1yiBWprJs=;
 b=ZjBcTWQoULy5N4QRjlbdHspm2bNXqGptDo5XadiHPLpJmX6Inrw+E5LNhG6yMcpJqb
 SoDlkLQKpUJehou5yBBwXLF/xbpV4k/10l33BiLXXGCmOk3KKvvLR6kGMxpplg2aIshM
 3IZb3nUUouQDotzzBx+bERjq0JnjIwisL5l5oeK0zFPgzZV7SGV7opCU+7t7xgYozMUA
 zIrcxyZKdTELMlPV073fs/okJgrjGDrRXxTCvXw0Z8ZEBbib8d4n8yrY1IOuHLzE5jfL
 yOf+PepF6K73b7DvFuavh5tEdulN3cVRczq0HD+ZC1a7UlkRn8OqRRmAVxxtgRe67S+P
 i0wg==
X-Gm-Message-State: APjAAAV/dehSJs/izbAIOKXQoNUQD1sMtoiZv4dBvW5W7qo4iKFebSel
 SIUSTy4W1dHH5CJGRptaexSuy2daSWT+IS+A3k3Dgg==
X-Google-Smtp-Source: APXvYqyLvrqL9+2djjkm5oDmyu6TBR/VTcbHT8LXp1+Qqn6i8UZsQnM8L+6QRLDvFH2PoeSNCF9OWXWUzZlPpylcYCA=
X-Received: by 2002:a19:5506:: with SMTP id n6mr21543764lfe.119.1554888057686; 
 Wed, 10 Apr 2019 02:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
 <CAPnigKkHnc_zWQDw2XzgUdGLn2rUar7tgwuXsh4rO6L7vCiJ6g@mail.gmail.com>
 <cbd4d001-b440-756e-4a08-55d864d00c46@linux.vnet.ibm.com>
 <0c195cff-f440-4e94-9ff7-bf07d068c188@linux.vnet.ibm.com>
 <59b5d802-aad2-ce8d-8d1e-15fa237e97a4@linux.vnet.ibm.com>
In-Reply-To: <59b5d802-aad2-ce8d-8d1e-15fa237e97a4@linux.vnet.ibm.com>
From: William Kennington <wak@google.com>
Date: Wed, 10 Apr 2019 02:20:46 -0700
Message-ID: <CAPnigKkJDxBjZPZYPwWTE8QOwZEqj20JWgL+tPW+DCMbH9rAwg@mail.gmail.com>
Subject: Re: Sending the FD over D-bus
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Apr 2019 09:21:04 -0000

On Tue, Apr 9, 2019 at 11:16 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
>
> On 10/04/19 10:28 AM, Deepak Kodihalli wrote:
> > On 10/04/19 10:23 AM, Deepak Kodihalli wrote:
> >> On 10/04/19 7:43 AM, William Kennington wrote:
> >>> What is the issue with just sending them over d-bus? The only party
> >>> that can view the messages outside of the normal unicast partner is
> >>> the dbus-broker process. You are still trusting the dbus-broker in the
> >>> file descriptor case. On top of that you are probably still trusting
> >>> the mapper to give you the correct service name prior to sending the
> >>> secrets.
> >>
> >>
> Ed, Richard mention that sending the secrets over D-bus is a security
> concern like some compromised application on the
>
> bmc can watch the D-bus traffic and get the secrets.
>
Yes, if you are root you can monitor the system bus and read the
secrets, but you can also load kernel modules and read process memory
for any process on the system. If we just ran daemons as unprivileged
users with access to the hardware resources they needed we wouldn't
have this problem. Untrusted, unprivileged programs can write into the
objectmapper right now anyway. I just don't want to see us create a
more complicated system that gives no actual security benefit.
> >> +1
> >>
> >>
> >> Ratan,
> >>
> >> In case bmcweb makes a D-Bus method call to phosphor-user-manager,
> >> and one of the args of that method call is the password, is the value
> >> of that argument even visible to other processes connected to the
> >> system bus?
>     yes whether it is a D-Bus method call or the D-Bus object having
> properties both are same, any application can watch it.
> >> If it is, two processes can talk to each other directly using
> >> libdbus, that wouldn't even involve the system d-bus
> >> daemon/dbus-broker I guess.
> I have to experiment that over libdbus, I haven't done that but seems
> p2p binding is there with Qt, not sure witrh sd-bus.
> >>
> >> Regards,
> >> Deepak
> >
> >
> > https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/19409/1/xyz/openbmc_project/User/Ldap/Config.interface.yaml
> > - the password here is a property, I guess that's the concern. Could
> > the API instead be a method call taking the password - with that it
> > would just be the two processes (and d-bus broker) that would have
> > visibility to this.
> >
> > Regards,
> > Deepak
> >
> >>> On Tue, Apr 9, 2019 at 12:49 PM Ratan Gupta
> >>> <ratagupt@linux.vnet.ibm.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> As Discussed in yesterday community call, I did some POC to send the
> >>>> unix FD object over the D-Bus.
> >>>>
> >>>> BackGround: We are exploring the possibilities how to send the secrets
> >>>> from one process to other process,
> >>>>
> >>>> a) If the IPC is D-bus
> >>>>
> >>>> b) Calling process doesn't have the root permission to write the
> >>>> secrets
> >>>> in the configuration file.
> >>>>
> >>>> One of the proposal came, Can the calling process  send the unix fd
> >>>> over
> >>>> the D-Bus instead of sending the actual password
> >>>>
> >>>> and receiving process reads the data from the sent fd.?
> >>>>
> >>>> There was a confusion if some other app can snoop the D-bus message
> >>>> and
> >>>> get the FD and read it.I tried to simulate the same
> >>>>
> >>>> behavior in the POC but not sure whether it is correct or not.
> >>>>
> >>>> This POC has two files which is attached with this mail.
> >>>>
> >>>> Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes the
> >>>> unix fd as parameter reads it and send the data back
> >>>>
> >>>> Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file,
> >>>> then
> >>>> opens the file and send the fd over D-bus.
> >>>>
> >>>>
> >>>> After sending the data over D-bus , I introduced a sleep of 15 sec so
> >>>> that I can try to open the same fd from other
> >>>>
> >>>> process,I open the python shell and try to open the shared FD but
> >>>> couldn't open it.
> >>>>
> >>>> Ratan
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>
> >
>
