import React from "react";
import { Info_S } from "./Sonia.js";
import { Info_Y } from "./Yann.js";

export const Boxes = () => {
    return (
        <div>
            <Someone>
                Yann
                <div className="spread_Y">
                    <Info_Y />
                </div>
            </Someone>
            <Someone>
                Sonia
                <div className="spread_S">
                    <Info_S />
                </div>
            </Someone>
        </div>
    );
};

const Someone = ({ children }) => {
    return (
        <div className="someone">
            <h3>{children}</h3>
        </div>
    );
};
