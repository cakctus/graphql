-- CreateTable
CREATE TABLE "Comment" (
    "id" SERIAL NOT NULL,
    "comment" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "cars_modificationId" BIGINT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Token" (
    "id" SERIAL NOT NULL,
    "refreshToken" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Token_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "password" TEXT NOT NULL,
    "lastLogin" TIMESTAMP(3),
    "isSuperuser" BOOLEAN NOT NULL DEFAULT false,
    "username" TEXT,
    "firstName" TEXT,
    "lastLame" TEXT,
    "email" TEXT NOT NULL,
    "isStaff" BOOLEAN,
    "isActive" BOOLEAN,
    "dateJoined" TIMESTAMP(3) NOT NULL,
    "activationLink" TEXT NOT NULL,
    "isActivated" BOOLEAN NOT NULL DEFAULT false,
    "accessToken" TEXT,
    "refreshToken" TEXT,
    "resetPasswordLink" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_group" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(150) NOT NULL,

    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_group_permissions" (
    "id" BIGSERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,

    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_permission" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "content_type_id" INTEGER NOT NULL,
    "codename" VARCHAR(100) NOT NULL,

    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_user" (
    "id" SERIAL NOT NULL,
    "password" VARCHAR(128) NOT NULL,
    "last_login" TIMESTAMPTZ(6),
    "is_superuser" BOOLEAN NOT NULL,
    "username" VARCHAR(150) NOT NULL,
    "first_name" VARCHAR(150) NOT NULL,
    "last_name" VARCHAR(150) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "is_staff" BOOLEAN NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "date_joined" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_user_groups" (
    "id" BIGSERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_user_user_permissions" (
    "id" BIGSERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,

    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_brand" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "image" VARCHAR(100),

    CONSTRAINT "cars_brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_dimensions" (
    "id" BIGSERIAL NOT NULL,
    "length" VARCHAR(300),
    "width" VARCHAR(300),
    "height" VARCHAR(300),
    "wheelbase" VARCHAR(300),
    "front_track" VARCHAR(300),
    "rear_back_track" VARCHAR(300),
    "minimum_turning_circle_turning_diameter" VARCHAR(300),
    "width_including_mirrors" VARCHAR(300),
    "front_overhang" VARCHAR(300),
    "rear_overhang" VARCHAR(300),
    "ride_height_ground_clearance" VARCHAR(300),
    "width_with_mirrors_folded" VARCHAR(300),
    "approach_angle" VARCHAR(300),
    "departure_angle" VARCHAR(300),
    "drag_coefficient_cd" VARCHAR(300),
    "ramp_angle" VARCHAR(300),
    "wading_depth" VARCHAR(300),

    CONSTRAINT "cars_dimensions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_drivetrainbrakessuspension" (
    "id" BIGSERIAL NOT NULL,
    "drivetrain_architecture" TEXT,
    "drive_wheel" TEXT,
    "number_of_gears_automatic_transmission" TEXT,
    "front_suspension" TEXT,
    "rear_suspension" TEXT,
    "front_brakes" TEXT,
    "rear_brakes" TEXT,
    "assisting_systems" TEXT,
    "steering_type" TEXT,
    "power_steering" TEXT,
    "tires_size" TEXT,
    "wheel_rims_size" TEXT,
    "number_of_gears_manual_transmission" TEXT,

    CONSTRAINT "cars_drivetrainbrakessuspension_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_electriccarshybrids" (
    "id" BIGSERIAL NOT NULL,
    "gross_battery_capacity" VARCHAR(300),
    "all_electric_range_wltp" VARCHAR(300),
    "all_electric_range" VARCHAR(300),
    "average_energy_consumption_wltp" VARCHAR(300),
    "average_energy_consumption" VARCHAR(300),
    "system_power" VARCHAR(300),
    "system_torque" VARCHAR(300),
    "average_energy_consumption_nedc" VARCHAR(300),
    "max_speed_electric" VARCHAR(300),
    "all_electric_range_nedc" VARCHAR(300),
    "net_usable_battery_capacity" VARCHAR(300),
    "battery_technology" VARCHAR(300),
    "recuperation_output" VARCHAR(300),
    "all_electric_range_nedc_wltp_equivalent" VARCHAR(300),
    "average_energy_consumption_nedc_wltp_equivalent" VARCHAR(300),
    "battery_voltage" VARCHAR(300),

    CONSTRAINT "cars_electriccarshybrids_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_electricengine" (
    "id" BIGSERIAL NOT NULL,
    "power" VARCHAR(64),
    "torque" VARCHAR(64),
    "location" VARCHAR(128),
    "system_power" VARCHAR(128),
    "system_torque" VARCHAR(128),

    CONSTRAINT "cars_electricengine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_engineoil" (
    "id" BIGSERIAL NOT NULL,
    "coolant" VARCHAR(32),
    "engine_systems" VARCHAR(32),

    CONSTRAINT "cars_engineoil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_generation" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "image" VARCHAR(100),
    "model_id" BIGINT,

    CONSTRAINT "cars_generation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_icengine" (
    "id" BIGSERIAL NOT NULL,
    "power" VARCHAR(32),
    "power_per_litre" VARCHAR(32),
    "torque" VARCHAR(32),
    "engine_location" VARCHAR(32),
    "engine_displacement" VARCHAR(32),
    "number_of_cylinders" VARCHAR(32),
    "position_of_cylinders" VARCHAR(32),
    "cylinder_bore" VARCHAR(32),
    "piston_stroke" VARCHAR(32),
    "compression_ratio" VARCHAR(32),
    "number_of_valves_per_cylinder" VARCHAR(32),
    "engine_aspiration" VARCHAR(32),
    "engine_oil_capacity" VARCHAR(32),
    "oil_viscosity" VARCHAR(32),
    "coolant" VARCHAR(32),
    "engine_model_code" VARCHAR(32),
    "fuel_system" VARCHAR(32),
    "valvetrain" VARCHAR(32),
    "engine_systems" VARCHAR(32),
    "maximum_engine_speed" VARCHAR(32),

    CONSTRAINT "cars_icengine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_internalcombustionengine" (
    "id" BIGSERIAL NOT NULL,
    "power" VARCHAR(300),
    "power_per_litre" VARCHAR(300),
    "torque" VARCHAR(300),
    "engine_location" VARCHAR(300),
    "engine_displacement" VARCHAR(300),
    "number_of_cylinders" VARCHAR(300),
    "position_of_cylinders" VARCHAR(300),
    "cylinder_bore" VARCHAR(300),
    "piston_stroke" VARCHAR(300),
    "compression_ratio" VARCHAR(300),
    "number_of_valves_per_cylinder" VARCHAR(300),
    "fuel_system" VARCHAR(300),
    "engine_aspiration" VARCHAR(300),
    "valvetrain" VARCHAR(300),
    "maximum_engine_speed" VARCHAR(300),
    "engine_model_code" VARCHAR(300),
    "engine_oil_capacity" VARCHAR(300),
    "oil_viscosity" VARCHAR(300),
    "coolant" VARCHAR(300),
    "engine_systems" VARCHAR(300),

    CONSTRAINT "cars_internalcombustionengine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_model" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "image" VARCHAR(100),
    "brand_id" BIGINT,

    CONSTRAINT "cars_model_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_modification" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(300),
    "image" VARCHAR(100),
    "start_prod" VARCHAR(300),
    "end_prod" VARCHAR(300),
    "powertrain_architecture" VARCHAR(300),
    "body_type" VARCHAR(300),
    "seats" VARCHAR(300),
    "doors" VARCHAR(300),
    "dimensions_id" BIGINT,
    "drivetrain_brakes_suspension_id" BIGINT,
    "electric_cars_hybrids_id" BIGINT,
    "engine_oil_id" BIGINT,
    "generation_id" BIGINT NOT NULL,
    "ic_engine_id" BIGINT,
    "internal_combustion_engine_id" BIGINT,
    "performance_id" BIGINT,
    "space_volume_weights_id" BIGINT,

    CONSTRAINT "cars_modification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_modification_electric_engine" (
    "id" BIGSERIAL NOT NULL,
    "modification_id" BIGINT NOT NULL,
    "electricengine_id" BIGINT NOT NULL,

    CONSTRAINT "cars_modification_electric_engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_performance" (
    "id" BIGSERIAL NOT NULL,
    "fuel_consumption_economy_urban" TEXT,
    "fuel_consumption_economy_extra_urban" TEXT,
    "fuel_consumption_economy_combined" TEXT,
    "co2_emissions" TEXT,
    "fuel_type" TEXT,
    "acceleration_0_100_km_h" TEXT,
    "acceleration_0_62_mph" TEXT,
    "maximum_speed" TEXT,
    "weight_to_power_ratio" TEXT,
    "weight_to_torque_ratio" TEXT,
    "emission_standard" TEXT,
    "fuel_consumption_at_low_speed_wltp" TEXT,
    "fuel_consumption_at_medium_speed_wltp" TEXT,
    "fuel_consumption_at_high_speed_wltp" TEXT,
    "fuel_consumption_at_very_high_speed_wltp" TEXT,
    "combined_fuel_consumption_wltp" TEXT,
    "co2_emissions_wltp" TEXT,
    "acceleration_0_60_mph" TEXT,
    "s_100_km_h_0" TEXT,
    "fuel_consumption_economy_urban_nedc_wltp_equivalent" TEXT,
    "fuel_consumption_economy_extra_urban_nedc_wltp_equivalent" TEXT,
    "fuel_consumption_economy_combined_nedc_wltp_equivalent" TEXT,
    "co2_emissions_nedc_wltp_equivalent" TEXT,
    "acceleration_0_300_km_h" TEXT,
    "fuel_consumption_economy_urban_nedc" TEXT,
    "fuel_consumption_economy_extra_urban_nedc" TEXT,
    "fuel_consumption_economy_combined_nedc" TEXT,
    "co2_emissions_nedc" TEXT,
    "fuel_consumption_at_low_speed_wltp_cng" TEXT,
    "fuel_consumption_at_medium_speed_wltp_cng" TEXT,
    "fuel_consumption_at_high_speed_wltp_cng" TEXT,
    "fuel_consumption_at_very_high_speed_wltp_cng" TEXT,
    "combined_fuel_consumption_wltp_cng" TEXT,
    "fuel_consumption_economy_urban_cng_nedc" TEXT,
    "fuel_consumption_economy_extra_urban_cng_nedc" TEXT,
    "fuel_consumption_economy_combin" TEXT,

    CONSTRAINT "cars_performance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_rating" (
    "id" SERIAL NOT NULL,
    "rating" INTEGER NOT NULL,
    "cars_modificationId" BIGINT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "cars_rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars_spacevolumeweights" (
    "id" BIGSERIAL NOT NULL,
    "kerb_weight" VARCHAR(300),
    "fuel_tank_capacity" VARCHAR(300),
    "trunk_boot_space_minimum" VARCHAR(300),
    "permitted_trailer_load_with_brakes_12" VARCHAR(300),
    "max_weight" VARCHAR(300),
    "max_load" VARCHAR(300),
    "trunk_boot_space_maximum" VARCHAR(300),
    "max_roof_load" VARCHAR(300),
    "adblue_tank" VARCHAR(300),
    "permitted_trailer_load_without_brakes" VARCHAR(300),
    "permitted_towbar_download" VARCHAR(300),
    "permitted_trailer_load_with_brakes_8" VARCHAR(300),
    "cng_cylinder_capacity" VARCHAR(300),

    CONSTRAINT "cars_spacevolumeweights_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_admin_log" (
    "id" SERIAL NOT NULL,
    "action_time" TIMESTAMPTZ(6) NOT NULL,
    "object_id" TEXT,
    "object_repr" VARCHAR(200) NOT NULL,
    "action_flag" SMALLINT NOT NULL,
    "change_message" TEXT NOT NULL,
    "content_type_id" INTEGER,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_content_type" (
    "id" SERIAL NOT NULL,
    "app_label" VARCHAR(100) NOT NULL,
    "model" VARCHAR(100) NOT NULL,

    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_migrations" (
    "id" BIGSERIAL NOT NULL,
    "app" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "applied" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_session" (
    "session_key" VARCHAR(40) NOT NULL,
    "session_data" TEXT NOT NULL,
    "expire_date" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
);

-- CreateTable
CREATE TABLE "moto_brakessuspensionframewheels" (
    "id" BIGSERIAL NOT NULL,
    "rear_brakes_diameter" VARCHAR(64),
    "rear_brakes" VARCHAR(64),
    "front_brakes_diameter" VARCHAR(64),
    "front_brakes" VARCHAR(64),
    "rear_tyre" VARCHAR(64),
    "front_tyre" VARCHAR(64),
    "rear_wheel_travel" VARCHAR(64),
    "front_wheel_travel" VARCHAR(64),
    "frame_type" VARCHAR(64),
    "wheels" VARCHAR(64),
    "rake" VARCHAR(64),
    "rear_suspension_travel" VARCHAR(64),
    "front_suspension_travel" VARCHAR(64),
    "rear_suspension" VARCHAR(64),
    "front_suspension" VARCHAR(64),
    "rear_tyre_dimensions" VARCHAR(64),
    "front_tyre_dimensions" VARCHAR(64),
    "seat" VARCHAR(64),
    "trail" VARCHAR(64),

    CONSTRAINT "moto_brakessuspensionframewheels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moto_brand" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "image" VARCHAR(100),

    CONSTRAINT "moto_brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moto_enginetransmissionspecifications" (
    "id" BIGSERIAL NOT NULL,
    "clutch" VARCHAR(64),
    "transmission_type_final_drive" VARCHAR(64),
    "gearbox" VARCHAR(64),
    "cooling_system" VARCHAR(64),
    "valves_per_cylinder" VARCHAR(64),
    "bore_x_stroke" VARCHAR(64),
    "torque" VARCHAR(64),
    "power" VARCHAR(64),
    "engine_type" VARCHAR(64),
    "capacity" VARCHAR(64),
    "engine_details" VARCHAR(64),
    "ignition" VARCHAR(64),
    "compression" VARCHAR(64),
    "stroke" VARCHAR(64),
    "emission_details" VARCHAR(64),
    "exhaust_system" VARCHAR(64),
    "top_speed" VARCHAR(64),
    "driveline" VARCHAR(64),
    "_0_100_kmh" VARCHAR(64),
    "_60_140_kmh_highest_gear" VARCHAR(64),
    "_14_mile" VARCHAR(64),

    CONSTRAINT "moto_enginetransmissionspecifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moto_model" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "image" VARCHAR(100),
    "link" VARCHAR(128),
    "brand_id" BIGINT,

    CONSTRAINT "moto_model_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moto_modification" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "category" VARCHAR(64),
    "year" VARCHAR(5),
    "image" VARCHAR(100) NOT NULL,
    "brakes_suspension_frame_wheels_id" BIGINT NOT NULL,
    "engine_transmission_specifications_id" BIGINT NOT NULL,
    "model_id" BIGINT NOT NULL,
    "other_specs_id" BIGINT NOT NULL,
    "physical_measures_capacities_id" BIGINT NOT NULL,

    CONSTRAINT "moto_modification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moto_otherspecs" (
    "id" BIGSERIAL NOT NULL,
    "comments" VARCHAR(64),
    "starter" VARCHAR(64),
    "color_options" VARCHAR(64),
    "reserve_fuel_capacity" VARCHAR(64),
    "electrical" VARCHAR(64),
    "factory_warranty" VARCHAR(64),
    "instruments" VARCHAR(64),
    "light" VARCHAR(64),
    "carrying_capacity" VARCHAR(64),
    "oil_capacity" VARCHAR(64),
    "lubrication_system" VARCHAR(64),
    "max_rpm" VARCHAR(64),
    "modifications_compared_to_previous_model" VARCHAR(64),
    "greenhouse_gases" VARCHAR(64),

    CONSTRAINT "moto_otherspecs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moto_physicalmeasurescapacities" (
    "id" BIGSERIAL NOT NULL,
    "fuel_capacity" VARCHAR(64),
    "fuel_control" VARCHAR(64),
    "fuel_system" VARCHAR(64),
    "fuel_consumption_pr_10_km" VARCHAR(64),
    "fuel_consumption" VARCHAR(64),
    "seat_height" VARCHAR(64),
    "alternate_seat_height" VARCHAR(64),
    "weight_incl_oil_gas_etc" VARCHAR(64),
    "wheelbase" VARCHAR(64),
    "ground_clearance" VARCHAR(64),
    "power_weight_ratio" VARCHAR(64),
    "dry_weight" VARCHAR(64),
    "overall_length" VARCHAR(64),
    "overall_width" VARCHAR(64),
    "overall_height" VARCHAR(64),
    "rear_percentage_of_weight" VARCHAR(64),
    "front_percentage_of_weight" VARCHAR(64),

    CONSTRAINT "moto_physicalmeasurescapacities_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_name_key" ON "auth_group"("name");

-- CreateIndex
CREATE INDEX "auth_group_name_a6ea08ec_like" ON "auth_group"("name");

-- CreateIndex
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions"("group_id");

-- CreateIndex
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions"("permission_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions"("group_id", "permission_id");

-- CreateIndex
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission"("content_type_id", "codename");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_username_key" ON "auth_user"("username");

-- CreateIndex
CREATE INDEX "auth_user_username_6821ab7c_like" ON "auth_user"("username");

-- CreateIndex
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups"("group_id");

-- CreateIndex
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups"("user_id", "group_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions"("user_id", "permission_id");

-- CreateIndex
CREATE INDEX "cars_generation_model_id_bab53011" ON "cars_generation"("model_id");

-- CreateIndex
CREATE INDEX "cars_model_brand_id_37ddf91e" ON "cars_model"("brand_id");

-- CreateIndex
CREATE INDEX "cars_modification_dimensions_id_5afe7c8e" ON "cars_modification"("dimensions_id");

-- CreateIndex
CREATE INDEX "cars_modification_drivetrain_brakes_suspension_id_0b379a05" ON "cars_modification"("drivetrain_brakes_suspension_id");

-- CreateIndex
CREATE INDEX "cars_modification_electric_cars_hybrids_id_3da51173" ON "cars_modification"("electric_cars_hybrids_id");

-- CreateIndex
CREATE INDEX "cars_modification_engine_oil_id_6cac5881" ON "cars_modification"("engine_oil_id");

-- CreateIndex
CREATE INDEX "cars_modification_generation_id_091547f4" ON "cars_modification"("generation_id");

-- CreateIndex
CREATE INDEX "cars_modification_ic_engine_id_92d81833" ON "cars_modification"("ic_engine_id");

-- CreateIndex
CREATE INDEX "cars_modification_internal_combustion_engine_id_eb1797cf" ON "cars_modification"("internal_combustion_engine_id");

-- CreateIndex
CREATE INDEX "cars_modification_performance_id_24479d2e" ON "cars_modification"("performance_id");

-- CreateIndex
CREATE INDEX "cars_modification_space_volume_weights_id_cb92cf4b" ON "cars_modification"("space_volume_weights_id");

-- CreateIndex
CREATE INDEX "cars_modification_electric_engine_electricengine_id_216b8965" ON "cars_modification_electric_engine"("electricengine_id");

-- CreateIndex
CREATE INDEX "cars_modification_electric_engine_modification_id_a25e576b" ON "cars_modification_electric_engine"("modification_id");

-- CreateIndex
CREATE UNIQUE INDEX "cars_modification_electr_modification_id_electric_94be9c58_uniq" ON "cars_modification_electric_engine"("modification_id", "electricengine_id");

-- CreateIndex
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log"("content_type_id");

-- CreateIndex
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type"("app_label", "model");

-- CreateIndex
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session"("expire_date");

-- CreateIndex
CREATE INDEX "django_session_session_key_c0390e0f_like" ON "django_session"("session_key");

-- CreateIndex
CREATE INDEX "moto_model_brand_id_f498781f" ON "moto_model"("brand_id");

-- CreateIndex
CREATE INDEX "moto_modification_brakes_suspension_frame_wheels_id_00cf2bae" ON "moto_modification"("brakes_suspension_frame_wheels_id");

-- CreateIndex
CREATE INDEX "moto_modification_engine_transmission_specif_87d89ec1" ON "moto_modification"("engine_transmission_specifications_id");

-- CreateIndex
CREATE INDEX "moto_modification_model_id_b4c16f1f" ON "moto_modification"("model_id");

-- CreateIndex
CREATE INDEX "moto_modification_other_specs_id_217c262e" ON "moto_modification"("other_specs_id");

-- CreateIndex
CREATE INDEX "moto_modification_physical_measures_capacities_id_30c4418d" ON "moto_modification"("physical_measures_capacities_id");

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_cars_modificationId_fkey" FOREIGN KEY ("cars_modificationId") REFERENCES "cars_modification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Token" ADD CONSTRAINT "Token_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth_group_permissions" ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_group_permissions" ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_permission" ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_groups" ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_groups" ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_generation" ADD CONSTRAINT "cars_generation_model_id_bab53011_fk_cars_model_id" FOREIGN KEY ("model_id") REFERENCES "cars_model"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_model" ADD CONSTRAINT "cars_model_brand_id_37ddf91e_fk_cars_brand_id" FOREIGN KEY ("brand_id") REFERENCES "cars_brand"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_dimensions_id_5afe7c8e_fk_cars_dimensions_id" FOREIGN KEY ("dimensions_id") REFERENCES "cars_dimensions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_drivetrain_brakes_su_0b379a05_fk_cars_driv" FOREIGN KEY ("drivetrain_brakes_suspension_id") REFERENCES "cars_drivetrainbrakessuspension"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_electric_cars_hybrid_3da51173_fk_cars_elec" FOREIGN KEY ("electric_cars_hybrids_id") REFERENCES "cars_electriccarshybrids"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_engine_oil_id_6cac5881_fk_cars_engineoil_id" FOREIGN KEY ("engine_oil_id") REFERENCES "cars_engineoil"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_generation_id_091547f4_fk_cars_generation_id" FOREIGN KEY ("generation_id") REFERENCES "cars_generation"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_ic_engine_id_92d81833_fk_cars_icengine_id" FOREIGN KEY ("ic_engine_id") REFERENCES "cars_icengine"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_internal_combustion__eb1797cf_fk_cars_inte" FOREIGN KEY ("internal_combustion_engine_id") REFERENCES "cars_internalcombustionengine"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_performance_id_24479d2e_fk_cars_perf" FOREIGN KEY ("performance_id") REFERENCES "cars_performance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification" ADD CONSTRAINT "cars_modification_space_volume_weights_cb92cf4b_fk_cars_spac" FOREIGN KEY ("space_volume_weights_id") REFERENCES "cars_spacevolumeweights"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification_electric_engine" ADD CONSTRAINT "cars_modification_el_electricengine_id_216b8965_fk_cars_elec" FOREIGN KEY ("electricengine_id") REFERENCES "cars_electricengine"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_modification_electric_engine" ADD CONSTRAINT "cars_modification_el_modification_id_a25e576b_fk_cars_modi" FOREIGN KEY ("modification_id") REFERENCES "cars_modification"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cars_rating" ADD CONSTRAINT "cars_rating_cars_modificationId_fkey" FOREIGN KEY ("cars_modificationId") REFERENCES "cars_modification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cars_rating" ADD CONSTRAINT "cars_rating_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "django_admin_log" ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "django_admin_log" ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "moto_model" ADD CONSTRAINT "moto_model_brand_id_f498781f_fk_moto_brand_id" FOREIGN KEY ("brand_id") REFERENCES "moto_brand"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "moto_modification" ADD CONSTRAINT "moto_modification_brakes_suspension_fr_00cf2bae_fk_moto_brak" FOREIGN KEY ("brakes_suspension_frame_wheels_id") REFERENCES "moto_brakessuspensionframewheels"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "moto_modification" ADD CONSTRAINT "moto_modification_engine_transmission__87d89ec1_fk_moto_engi" FOREIGN KEY ("engine_transmission_specifications_id") REFERENCES "moto_enginetransmissionspecifications"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "moto_modification" ADD CONSTRAINT "moto_modification_model_id_b4c16f1f_fk_moto_model_id" FOREIGN KEY ("model_id") REFERENCES "moto_model"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "moto_modification" ADD CONSTRAINT "moto_modification_other_specs_id_217c262e_fk_moto_otherspecs_id" FOREIGN KEY ("other_specs_id") REFERENCES "moto_otherspecs"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "moto_modification" ADD CONSTRAINT "moto_modification_physical_measures_ca_30c4418d_fk_moto_phys" FOREIGN KEY ("physical_measures_capacities_id") REFERENCES "moto_physicalmeasurescapacities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

