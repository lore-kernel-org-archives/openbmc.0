Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LIdUKSeQ"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnf2M1F8PzDrVw
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 08:51:06 +1000 (AEST)
Received: by mail-pf0-x241.google.com with SMTP id q76so3650258pfq.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 15:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=mxx4Klx4SLsnkX3NcYap5sYBEta1RkE8Y+lRDdPzrrI=;
 b=LIdUKSeQERD1rnClGO0wRb+7cjDnk6Brw6+OIz60GleJRkiFoCNneCwxJQK9NsRWsw
 mRr1KV9H2Inu0eN0gADdJ6otKJUn4/EU5uQH5Q0RXPdh7DK2lWV53nrJXVSOUlIG6TuT
 5tdXvrp0Ky5rk7ApN/2uIojM3KXUzFHHaLuTUsrL9fTrI4k12mYwST+qvVC2lrRjzP5U
 bb/HFVeCfHZmj2YH58fMWNyFg89baTZSLGneLuW5gg3Kv562C0LLPCc/uz8DnZuATvdh
 GdPQwVbGIImRsYmtp7xMTRMkf/ovVHhPvlzdPqKNzH9rW0nT7HFcYRFIAOmE22djI1p+
 GeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=mxx4Klx4SLsnkX3NcYap5sYBEta1RkE8Y+lRDdPzrrI=;
 b=anCfC3H6gPzW68dLs4hTo9C99z17FjiLIHxBN8aJ4A7I1YNYC7VLWHYnATISDK0kdE
 y+qWTymiXSqYb3WnThD5WJwYsEcHHkucx1KkbHULFWNtYCDWdkinr3HX9Uh2UHCE/9BV
 kJmKpGo7rf4BZFqCzb1q5IoxLbF7vA3wDr5H30GDzDVH0uX2EKk+0eLTnCtQgH4kuhNv
 bt65M4nYtH/PYrgeNnEaGX4ZeVI/EgVaHaLO6z2vGgI1q6/vjSnqLLt144OiliR9xqfj
 Qd9X3oY+1NkBSEQWnRBrj2AtOdjtctitfysv4A/NdAwPVcx9pXIDNPeLhO7z6znwBkre
 N6wA==
X-Gm-Message-State: AHPjjUioGgCY2CoJBKf4b3E/kgECiIFtgs/K8QeEvZmNhyeMsdzXACn2
 iTlMFaDrUDP5kA==
X-Google-Smtp-Source: ADKCNb5sAx9yhbSpcTGpOgNoc9Iq05cUq9hWASEYBgUi1RNfAqO3tUb5qVSEIMNXjru9+kyQ0Pxaqw==
X-Received: by 10.98.194.84 with SMTP id l81mr670174pfg.303.1504738264194;
 Wed, 06 Sep 2017 15:51:04 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id m184sm994674pfc.82.2017.09.06.15.51.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Sep 2017 15:51:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 Sep 2017 15:51:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
Message-ID: <20170906225102.GA32210@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net>
 <1504657417.28363.8.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1504657417.28363.8.camel@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 06 Sep 2017 22:51:08 -0000

On Wed, Sep 06, 2017 at 10:23:37AM +1000, Andrew Jeffery wrote:
> On Tue, 2017-09-05 at 10:00 -0700, Guenter Roeck wrote:
> > On Tue, Sep 05, 2017 at 05:01:32PM +1000, Andrew Jeffery wrote:
> > > Some functions exposed by pmbus core conflated errors that occurred when
> > > setting the page to access with errors that occurred when accessing
> > > registers in a page. In some cases, this caused legitimate errors to be
> > > hidden under the guise of the register not being supported.
> > > 
> > 
> > I'll have to look into this. If I recall correctly, the reason for not returning
> > errors from the "clear faults" command was that some early chips did not support
> > it, or did not support it on all pages. Those chips would now always fail.
> 
> Yes, that is a concern.
> 
> However, shouldn't the lack of support for CLEAR_FAULTS be a described
> property of the chip or page?
> 
> Regardless, the issue here is the PAGE command is sometimes failing
> (more below). This means we won't have issued a CLEAR_FAULTS against
> the page even if the page supports CLEAR_FAULTS. That to me is
> something that should be propagated back up the call chain, as faults
> that can be cleared will not have been.
> 
We could also consider
- retry
- Add a marker indicating that faults (specifically command errors)
  are unreliable after clearing faults failed

If we can't reliably clear faults, all bets are off.

> > 
> > On a higher level, I am not sure if it is a good idea to return an error
> > from a function intended to clear faults (and nothing else). That seems
> > counterproductive.
> > 
> > Is this a problem you have actually observed ? 
> 
> Unfortunately yes. I was trying to reproduce some issues that we are
> seeing in userspace but wasn't having much luck (getting -EIO on
> reading a hwmon attribute). I ended up instrumenting our I2C bus
> driver, and found that the problem was more prevalent than what the
> read failures in userspace were indicating. The paths that were
> triggering these unreported conditions all traced through the check
> register and clear fault functions, which on analysis were swallowing
> the error.
> 
> > If so, what is the chip ?
> 
> Well, the chip that I'm *communicating* with is the Maxim MAX31785
> Intelligent Fan Controller. As to whether that's what is *causing* the
> PAGE command to fail is still up in the air. I would not be surprised
> if we have other issues in the hardware design.
> 
> I haven't sent a follow-up to the series introducing the MAX31785
> driver because I've been chasing down communication issues. I felt it
> was important to understand whether the device has quirks that need to
> be worked around in the driver, or if our hardware design has bigger
> problems that should be handled in other ways. I've been in touch with
> Maxim who have asserted that some of the problems we're seeing cannot
> be caused by their chip.
> 

Guess I need to dig up my eval board and see if I can reproduce the problem.
Seems you are saying that the problem is always seen when issuing a sequence
of "clear faults" commands on multiple pages ?

The MAX31785 is microcode based, so I would not be entirely surprised if
it sometimes fails to reply if a sequence of <set page, clear faults>
commands is executed.

If possible, you might try reducing the i2c clock. I have not seen that with
Maxim chips, but some other PMBus chips don't operate reliably at 400 KHz.

Guenter

> > 
> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  Documentation/hwmon/pmbus-core   |  12 ++--
> > >  drivers/hwmon/pmbus/pmbus.h      |   6 +-
> > >  drivers/hwmon/pmbus/pmbus_core.c | 115 +++++++++++++++++++++++++++++----------
> > >  3 files changed, 95 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/Documentation/hwmon/pmbus-core b/Documentation/hwmon/pmbus-core
> > > index 8ed10e9ddfb5..3e9f41bb756f 100644
> > > --- a/Documentation/hwmon/pmbus-core
> > > +++ b/Documentation/hwmon/pmbus-core
> > > @@ -218,17 +218,17 @@ Specifically, it provides the following information.
> > >    This function calls the device specific write_byte function if defined.
> > >    Therefore, it must _not_ be called from that function.
> > >  
> > > -  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> > > +  int pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> > >  
> > > -  Check if byte register exists. Return true if the register exists, false
> > > -  otherwise.
> > > +  Check if byte register exists. Returns 1 if the register exists, 0 if it does
> > > +  not, and less than zero on an unexpected error.
> > >    This function calls the device specific write_byte function if defined to
> > >    obtain the chip status. Therefore, it must _not_ be called from that function.
> > >  
> > > -  bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> > > +  int pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> > >  
> > > -  Check if word register exists. Return true if the register exists, false
> > > -  otherwise.
> > > +  Check if word register exists. Returns 1 if the register exists, 0 if it does
> > > +  not, and less than zero on an unexpected error.
> > >    This function calls the device specific write_byte function if defined to
> > >    obtain the chip status. Therefore, it must _not_ be called from that function.
> > >  
> > > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > > index bfcb13bae34b..c53032a04a6f 100644
> > > --- a/drivers/hwmon/pmbus/pmbus.h
> > > +++ b/drivers/hwmon/pmbus/pmbus.h
> > > @@ -413,9 +413,9 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
> > > > >  			  u8 value);
> > >  int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
> > > > >  			   u8 mask, u8 value);
> > > -void pmbus_clear_faults(struct i2c_client *client);
> > > -bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> > > -bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> > > +int pmbus_clear_faults(struct i2c_client *client);
> > > +int pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> > > +int pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> > >  int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
> > > > >  		   struct pmbus_driver_info *info);
> > >  int pmbus_do_remove(struct i2c_client *client);
> > > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > > index f1eff6b6c798..153700e35431 100644
> > > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > > @@ -304,18 +304,24 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
> > > > >  	return pmbus_read_byte_data(client, page, reg);
> > >  }
> > >  
> > > -static void pmbus_clear_fault_page(struct i2c_client *client, int page)
> > > +static int pmbus_clear_fault_page(struct i2c_client *client, int page)
> > >  {
> > > > > -	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> > > > > +	return _pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> > >  }
> > >  
> > > -void pmbus_clear_faults(struct i2c_client *client)
> > > +int pmbus_clear_faults(struct i2c_client *client)
> > >  {
> > > > >  	struct pmbus_data *data = i2c_get_clientdata(client);
> > > > > +	int rv;
> > > > >  	int i;
> > >  
> > > > > -	for (i = 0; i < data->info->pages; i++)
> > > > > -		pmbus_clear_fault_page(client, i);
> > > > > +	for (i = 0; i < data->info->pages; i++) {
> > > > > +		rv = pmbus_clear_fault_page(client, i);
> > > > > +		if (rv)
> > > > > +			return rv;
> > > > > +	}
> > > +
> > > > > +	return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(pmbus_clear_faults);
> > >  
> > > @@ -333,28 +339,45 @@ static int pmbus_check_status_cml(struct i2c_client *client)
> > > > >  	return 0;
> > >  }
> > >  
> > > -static bool pmbus_check_register(struct i2c_client *client,
> > > +static int pmbus_check_register(struct i2c_client *client,
> > > > >  				 int (*func)(struct i2c_client *client,
> > > > >  					     int page, int reg),
> > > > >  				 int page, int reg)
> > >  {
> > > > > +	struct pmbus_data *data;
> > > > > +	int check;
> > > > >  	int rv;
> > > > > -	struct pmbus_data *data = i2c_get_clientdata(client);
> > >  
> > > > > -	rv = func(client, page, reg);
> > > > > -	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> > > > > -		rv = pmbus_check_status_cml(client);
> > > > > -	pmbus_clear_fault_page(client, -1);
> > > > > -	return rv >= 0;
> > > > > +	data = i2c_get_clientdata(client);
> > > +
> > > > > +	/*
> > > > > +	 * pmbus_set_page() guards transactions on the requested page matching
> > > > > +	 * the current page. This may be done in the execution of func(), but
> > > > > +	 * at that point a set-page error is conflated with accessing a
> > > > > +	 * non-existent register.
> > > > > +	 */
> > > > > +	rv = pmbus_set_page(client, page);
> > > > > +	if (rv < 0)
> > > > > +		return rv;
> > > +
> > > > > +	check = func(client, page, reg);
> > > > > +	if (check >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> > > > > +		check = pmbus_check_status_cml(client);
> > > +
> > > > > +	rv = pmbus_clear_fault_page(client, -1);
> > > > > +	if (rv < 0)
> > > > > +		return rv;
> > > +
> > > > > +	return check >= 0;
> > >  }
> > >  
> > > -bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
> > > +int pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
> > >  {
> > > > >  	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
> > >  }
> > >  EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
> > >  
> > > -bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
> > > +int pmbus_check_word_register(struct i2c_client *client, int page, int reg)
> > >  {
> > > > >  	return pmbus_check_register(client, _pmbus_read_word_data, page, reg);
> > >  }
> > > @@ -390,7 +413,7 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
> > >  
> > > > >  	mutex_lock(&data->update_lock);
> > > > >  	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> > > > > -		int i, j;
> > > > > +		int i, j, ret;
> > >  
> > > > >  		for (i = 0; i < info->pages; i++) {
> > > > >  			data->status[PB_STATUS_BASE + i]
> > > @@ -424,7 +447,13 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
> > > > >  							    sensor->page,
> > > > >  							    sensor->reg);
> > > > >  		}
> > > > > -		pmbus_clear_faults(client);
> > > +
> > > > > +		ret = pmbus_clear_faults(client);
> > > > > +		if (ret < 0) {
> > > > > +			mutex_unlock(&data->update_lock);
> > > > > +			return ERR_PTR(ret);
> > > > > +		}
> > > +
> > > > >  		data->last_updated = jiffies;
> > > > >  		data->valid = 1;
> > > > >  	}
> > > @@ -754,6 +783,9 @@ static ssize_t pmbus_show_boolean(struct device *dev,
> > > > >  	struct pmbus_data *data = pmbus_update_device(dev);
> > > > >  	int val;
> > >  
> > > > > +	if (IS_ERR(data))
> > > > > +		return PTR_ERR(data);
> > > +
> > > > >  	val = pmbus_get_boolean(data, boolean, attr->index);
> > > > >  	if (val < 0)
> > > > >  		return val;
> > > @@ -766,6 +798,9 @@ static ssize_t pmbus_show_sensor(struct device *dev,
> > > > >  	struct pmbus_data *data = pmbus_update_device(dev);
> > > > >  	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
> > >  
> > > > > +	if (IS_ERR(data))
> > > > > +		return PTR_ERR(data);
> > > +
> > > > >  	if (sensor->data < 0)
> > > > >  		return sensor->data;
> > >  
> > > @@ -995,7 +1030,11 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
> > > > >  	struct pmbus_sensor *curr;
> > >  
> > > > >  	for (i = 0; i < nlimit; i++) {
> > > > > -		if (pmbus_check_word_register(client, page, l->reg)) {
> > > > > +		ret = pmbus_check_word_register(client, page, l->reg);
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > +
> > > > > +		if (ret) {
> > > > >  			curr = pmbus_add_sensor(data, name, l->attr, index,
> > > > >  						page, l->reg, attr->class,
> > > > >  						attr->update || l->update,
> > > @@ -1041,6 +1080,8 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
> > > > >  	if (!base)
> > > > >  		return -ENOMEM;
> > > > >  	if (attr->sfunc) {
> > > > > +		int check;
> > > +
> > > > >  		ret = pmbus_add_limit_attrs(client, data, info, name,
> > > > >  					    index, page, base, attr);
> > > > >  		if (ret < 0)
> > > @@ -1050,9 +1091,13 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
> > > > >  		 * alarm attributes, if there is a global alarm bit, and if
> > > > >  		 * the generic status register for this page is accessible.
> > > > >  		 */
> > > > > -		if (!ret && attr->gbit &&
> > > > > -		    pmbus_check_byte_register(client, page,
> > > > > -					      data->status_register)) {
> > > +
> > > > > +		check = pmbus_check_byte_register(client, page,
> > > > > +						  data->status_register);
> > > > > +		if (check < 0)
> > > > > +			return check;
> > > +
> > > > > +		if (!ret && attr->gbit && check) {
> > > > >  			ret = pmbus_add_boolean(data, name, "alarm", index,
> > > > >  						NULL, NULL,
> > > > >  						PB_STATUS_BASE + page,
> > > @@ -1604,8 +1649,12 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
> > > > >  			if (!(info->func[page] & pmbus_fan_flags[f]))
> > > > >  				break;
> > >  
> > > > > -			if (!pmbus_check_word_register(client, page,
> > > > > -						       pmbus_fan_registers[f]))
> > > > > +			ret = pmbus_check_word_register(client, page,
> > > > > +						       pmbus_fan_registers[f]);
> > > > > +			if (ret < 0)
> > > > > +				return ret;
> > > +
> > > > > +			if (!ret)
> > > > >  				break;
> > >  
> > > > >  			/*
> > > @@ -1628,9 +1677,13 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
> > > > >  			 * Each fan status register covers multiple fans,
> > > > >  			 * so we have to do some magic.
> > > > >  			 */
> > > > > -			if ((info->func[page] & pmbus_fan_status_flags[f]) &&
> > > > > -			    pmbus_check_byte_register(client,
> > > > > -					page, pmbus_fan_status_registers[f])) {
> > > > > +			ret =  pmbus_check_byte_register(client, page,
> > > > > +						pmbus_fan_status_registers[f]);
> > > > > +			if (ret < 0)
> > > > > +				return ret;
> > > +
> > > > > +			if ((info->func[page] & pmbus_fan_status_flags[f])
> > > > > +					&& ret) {
> > > > >  				int base;
> > >  
> > > > > > >  				if (f > 1)	/* fan 3, 4 */
> > > @@ -1696,10 +1749,13 @@ static int pmbus_identify_common(struct i2c_client *client,
> > > > >  				 struct pmbus_data *data, int page)
> > >  {
> > > > >  	int vout_mode = -1;
> > > > > +	int rv;
> > >  
> > > > > -	if (pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE))
> > > > > +	rv = pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE);
> > > > > +	if (rv == 1)
> > > > >  		vout_mode = _pmbus_read_byte_data(client, page,
> > > > >  						  PMBUS_VOUT_MODE);
> > > +
> > > > >  	if (vout_mode >= 0 && vout_mode != 0xff) {
> > > > >  		/*
> > > > >  		 * Not all chips support the VOUT_MODE command,
> > > @@ -1725,8 +1781,7 @@ static int pmbus_identify_common(struct i2c_client *client,
> > > > >  		}
> > > > >  	}
> > >  
> > > > > -	pmbus_clear_fault_page(client, page);
> > > > > -	return 0;
> > > > > +	return pmbus_clear_fault_page(client, page);
> > >  }
> > >  
> > >  static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
> > > @@ -1756,7 +1811,9 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
> > > > >  	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
> > > > >  		client->flags |= I2C_CLIENT_PEC;
> > >  
> > > > > -	pmbus_clear_faults(client);
> > > > > +	ret = pmbus_clear_faults(client);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > >  
> > > > >  	if (info->identify) {
> > > > >  		ret = (*info->identify)(client, info);
> > > -- 
> > > 2.11.0
> > > 
