Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wK0Jn5xLFzDq5W
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 15:07:53 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1493960865.3948.70.camel@fuzziesquirrel.com>
Subject: Re: phosphor-hwmon bottleneck potential
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>, Nancy
 Yuen <yuenn@google.com>, Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Fri, 05 May 2017 01:07:45 -0400
In-Reply-To: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 05 May 2017 05:07:54 -0000

Hi Patrick, thanks for the feedback!

On Thu, 2017-05-04 at 09:11 -0700, Patrick Venture wrote:
> The system upon which I'm presently running openbmc uses
> phosphor-hwmon to expose reading of fans and thermal sensors.  And its
> works great for precisely this function, however, when another program
> attempts to get the sensor values over dbus from phosphor-hwmon I run
> into timing issues that can likely be addressed.
> 
> 
> The driver we're using for the fans requires a time period to measure
>  its RPMs.  I don't know if this is the only driver on earth that does
> so, but if it is --then this is only a problem I'll run into.

I think this is a pretty critical point.  If this is one-off driver
behavior I'm not very excited about adding special code to
phosphor-hwmon to work around it.  But if its SOP for hwmon drivers, we
should definitely improve phosphor-hwmon to handle long read times (more
on long read times below).

>   The time period is about 1 second.

I'm translating this slightly and assuming it to mean the read system
call on the sysfs attribute blocks phosphor-hwmon for ~1 second.  If
that is the case it would explain the observed behavior.

I didn't consider such long blocking read operations on the sysfs entry
when implementing phosphor-hwmon.

> 
> 
> As it stands now, there is one expected problem and one bizarre one
> that I haven't traced down.
> 
> 
> Firstly, if I try to read a specific fan speed it takes 8s to get a
> response from phosphor-hwmon over dbus.  This may be that it's

This is what I would expect given the read delay.  The Dbus handler
doesn't make read system calls on files in sysfs, but there is a single
loop handling both the dbus socket and updating sensor values.  What is
happening is that the loop body is taking eight seconds so the call to
process dbus traffic is only occurring every eight seconds.

>  reading all the fan speeds before returning; but I haven't verified
> it.  There are eight fans on the system being handled by that instance
> of phosphor-hwmon, but the 8 seconds could be a coincidence.  I'd need
> to really look at how it handles dbus requests to determine that
> that's the issue.
> 
> 
> To avoid this, I registered for listen for Sensor.Value updates over
> dbus, however, from looking at the round robin sensor update loop, my
> hypothesis is that I would receive an update from each fan once every
> 8 seconds or so given its first time to run.  This was effectively
> what I saw, except of course it was an update to the sensor every 9
> seconds, because my hypothesis forgot to account for the one second
> pause between each loop iteration.

Right, each sensor is only being polled once every 8+1 seconds, so
events won't be triggered any faster than that.

> 
> 
> The solution that comes to mind would be to simply parallelize sensor
> updates, such that phosphor-hwmon uses threads to update the sensor

I think this is a great idea.  But I would vote for some kind of
non-blocking or async io rather than threads.  I don't know what support
for that sort of thing is available in the hwmon subsystem so I'm not
sure if its even possible, but it seems worth a look anyway.

>  values independently of each other.  There are certainly downsides to
> this implementation and it won't be 100% optimized because there are
> switching overheads with threads, but since my driver read

non-blocking IO would address these concerns.

>  appears to be a bottleneck, each thread will take their 1 second
> reading different files and update the information more rapidly.  This
> also prevents other sensors under the same configuration from
> interfering with general updates to the dbus sensor namespace.  My
> system runs four instances of phosphor-hwmon because of the layout,
> but others may run different variations and experience other problems
> that could be alleviated by multi-threading.
> 
> 
> The other suggestion I have to improve involves adding a timestamp to
> phosphos-dbus-interfaces for Sensor.Value to let the recipient of the
> information know when it was last updated.  Certainly if someone

When a dbus signal is emitted for a property changed event, the time
associated with the signal is "right now".  When invoking Get on the
sensor value property, again the timestamp of the data provided by the
method call is "right now".

If an application wants to grab a timestamp when it gets a signal or
makes a Get method call and associate it with the sensor value I think
thats fine but I'm not seeing the value in requiring that every
implementation of a sensor do that.

>  listens for property updates, they can produce this information
> themselves, but it doesn't hurt to provide it to any reader

Honestly I'm not able to come up with a reason that it doesn't hurt.
But it hurts even less for the application using the Dbus interface to
collect the timestamp itself does it not?  Is it not preferable to have
a reduced API requirement for applications implementing sensors?

>  regardless of mechanism and as it stands now, it feels missing.  It's
> true that some drivers cache the information, and phosphor-hwmon
> itself waits one second before looping around to update, but a way to
> reduce some amount of ambiguity would be to provide a timestamp on the
> information.  By adding a timestamp the information would also come
> across to the reader as more of a time series, which is more or less
> is.
> 
> 
> Without multi-threading to remove the timing bottleneck on my
> platform, and the inability to provide other more direct interfaces
> for controlling fans, I'll be unable to use phosphor-hwmon as a
> primary source for reading/writing sensor data and will be unable to
> upstream any effort i make to write a pluggable thermal controller.
> 
> 
> I felt it was important to thoroughly explain my reasoning as other
> engineering teams attempting to use openbmc for their platforms could
> run into similar problems and that the decision to develop
> independently was data-driven and not arbitrary.
> 
> 
> Patrick
